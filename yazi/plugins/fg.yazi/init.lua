local function splitAndGetFirst(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local sepStart, sepEnd = string.find(inputstr, sep)
	if sepStart then
		return string.sub(inputstr, 1, sepStart - 1)
	end
	return inputstr
end

local state = ya.sync(function() return tostring(cx.active.current.cwd) end)

local function fail(s, ...) ya.notify { title = "Fzf", content = string.format(s, ...), timeout = 5, level = "error" } end

local function entry(_, args)
	local _permit = ya.hide()
	local cwd = state()
	local shell_value = os.getenv("SHELL"):match(".*/(.*)")
	local cmd_args = ""

	local preview_cmd =
		[===[line={2} && begin=$( if [[ $line -lt 7 ]]; then echo $((line-1)); else echo 6; fi ) && bat --highlight-line={2} --color=always --line-range $((line-begin)):$((line+10)) {1}]===]
	if shell_value == "fish" then
		preview_cmd =
			[[set line {2} && set begin ( test $line -lt 7  &&  echo (math "$line-1") || echo  6 ) && bat --highlight-line={2} --color=always --line-range (math "$line-$begin"):(math "$line+10") {1}]]
	elseif shell_value == "nu" then
		preview_cmd =
			[[let line = ({2} | into int); let begin = if $line < 7 { $line - 1 } else { 6 }; bat --highlight-line={2} --color=always --line-range $'($line - $begin):($line + 10)' {1}]]
	end

	if args[1] == "fzf" then
		cmd_args = [[fzf --preview='bat --color=always {1}']]
	elseif args[1] == "rg" and shell_value == "fish" then
		cmd_args = [[
			RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case " \
			fzf --ansi --disabled \
				--bind "start:reload:$RG_PREFIX {q}" \
				--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
				--delimiter : \
				--preview ']] .. preview_cmd .. [[' \
				--preview-window 'up,60%' \
				--nth '3..'
		]]
	elseif args[1] == "rg" and (shell_value == "bash" or shell_value == "zsh") then
		cmd_args = [[
			RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
			fzf --ansi --disabled \
				--bind "start:reload:$RG_PREFIX {q}" \
				--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
				--delimiter : \
				--preview ']] .. preview_cmd .. [[' \
				--preview-window 'up,60%' \
				--nth '3..'
		]]
	elseif args[1] == "rg" and shell_value == "nu" then
		local rg_prefix = "rg --column --line-number --no-heading --color=always --smart-case "
		cmd_args = [[fzf --ansi --disabled --bind "start:reload:]]
			.. rg_prefix
			.. [[{q}" --bind "change:reload:sleep 100ms; try { ]]
			.. rg_prefix
			.. [[{q} }" --delimiter : --preview ']]
			.. preview_cmd
			.. [[' --preview-window 'up,60%' --nth '3..']]
	elseif args[1] == "rga" and shell_value == "fish" then
		cmd_args = [[
			RG_PREFIX="rga --files-with-matches --color ansi --smart-case --max-count=1 --no-messages --hidden --follow --no-ignore --glob '!.git' --glob !'.venv' --glob '!node_modules' --glob '!.history' --glob '!.Rproj.user' --glob '!.ipynb_checkpoints' " \
			fzf --ansi --disabled \
			        --layout=reverse \
        			--sort \
        			--header-first \
        			--header '---- Search inside files ----' \
				--bind "start:reload:$RG_PREFIX {q}" \
				--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
				--delimiter : \
				--preview 'rga --smart-case --pretty --context 5 {q} {}' \
				--preview-window 'up,60%' \
				--nth '3..'
		]]
	elseif args[1] == "rga" and (shell_value == "bash" or shell_value == "zsh") then
		cmd_args = [[
			RG_PREFIX="rga --files-with-matches --color ansi --smart-case --max-count=1 --no-messages --hidden --follow --no-ignore --glob '!.git' --glob !'.venv' --glob '!node_modules' --glob '!.history' --glob '!.Rproj.user' --glob '!.ipynb_checkpoints' "
			fzf --ansi --disabled \
			        --layout=reverse \
        			--sort \
        			--header-first \
        			--header '---- Search inside files ----' \
				--bind "start:reload:$RG_PREFIX {q}" \
				--bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
				--delimiter : \
				--preview 'rga --smart-case --pretty --context 5 {q} {}' \
				--preview-window 'up,60%' \
				--nth '3..'
		]]
	elseif args[1] == "rga" and shell_value == "nu" then
		local rg_prefix =
			"rga --files-with-matches --color ansi --smart-case --max-count=1 --no-messages --hidden --follow --no-ignore --glob '!.git' --glob !'.venv' --glob '!node_modules' --glob '!.history' --glob '!.Rproj.user' --glob '!.ipynb_checkpoints' "
		cmd_args = [[fzf --ansi --disabled --layout=reverse --sort --header-first --header '---- Search inside files ----' --bind "start:reload:]]
			.. rg_prefix
			.. [[{q}" --bind "change:reload:sleep 100ms; try { ]]
			.. rg_prefix
			.. [[{q} }" --delimiter : --preview 'rga --smart-case --pretty --context 5 {q} {}' --preview-window 'up,60%' --nth '3..']]
	else
		cmd_args = [[rg --color=always --line-number --no-heading --smart-case '' | fzf --ansi --preview=']]
			.. preview_cmd
			.. [[' --delimiter=':' --preview-window='up:60%' --nth='3..']]
	end

	local child, err = Command(shell_value)
		:args({ "-c", cmd_args })
		:cwd(cwd)
		:stdin(Command.INHERIT)
		:stdout(Command.PIPED)
		:stderr(Command.INHERIT)
		:spawn()

	if not child then
		return fail("Spawn `rfzf` failed with error code %s. Do you have it installed?", err)
	end

	local output, err = child:wait_with_output()
	if not output then
		return fail("Cannot read `fzf` output, error code %s", err)
	elseif not output.status.success and output.status.code ~= 130 then
		return fail("`fzf` exited with error code %s", output.status.code)
	end

	local target = output.stdout:gsub("\n$", "")

	local file_url = splitAndGetFirst(target, ":")

	if file_url ~= "" then
		ya.manager_emit(file_url:match("[/\\]$") and "cd" or "reveal", { file_url })
	end
end

return { entry = entry }
