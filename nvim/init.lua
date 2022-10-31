-- Shortcut Variables
local vim = vim
local api = vim.api
local map = api.nvim_set_keymap
local o = vim.o
local create_command = api.nvim_create_user_command
local cmd = api.nvim_command

-- ooooooooo.   oooo                          o8o                       
-- `888   `Y88. `888                          `"'                       
--  888   .d88'  888  oooo  oooo   .oooooooo oooo  ooo. .oo.    .oooo.o 
--  888ooo88P'   888  `888  `888  888' `88b  `888  `888P"Y88b  d88(  "8 
--  888          888   888   888  888   888   888   888   888  `"Y88b.  
--  888          888   888   888  `88bod8P'   888   888   888  o.  )88b 
-- o888o        o888o  `V88V"V8P' `8oooooo.  o888o o888o o888o 8""888P' 
--                                d"     YD                             
--                                "Y88888P'                             
--
-- 
require('packer').startup(function()
	use 'aquach/vim-mediawiki-editor'
	use 'wbthomason/packer.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'nvim-treesitter/nvim-treesitter'
	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use 'bluz71/vim-moonfly-colors'
	use 'andweeb/presence.nvim'
	use 'jiangmiao/auto-pairs'
end)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Plugin Options
vim.g["indentLine_char"] = "╎"

-- Plugin Keymaps
cmd([[
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
]])

cmd([[inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"]])
cmd([[inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()]])
map('n', '<C-P>', '<cmd>Telescope find_files<cr>', { noremap = true})
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })

-- oooooooooo.                      o8o                     
-- `888'   `Y8b                     `"'                     
--  888     888  .oooo.    .oooo.o oooo   .ooooo.   .oooo.o 
--  888oooo888' `P  )88b  d88(  '8 `888  d88' `"Y8 d88(  "8 
--  888    `88b  .oP"888  `"Y88b.   888  888       `"Y88b.  
--  888    .88P d8(  888  o.  )88b  888  888   .o8 o.  )88b 
-- o888bood8P'  `Y888""8o 8""888P' o888o `Y8bod8P' 8""888P' 
--                 
-- Settings
local options = {
	mouse = 'a',
	clipboard = 'unnamedplus',
	title = true,
	titlestring = 'NVIM: %-25.55F %a%r%m',
	number = true,
	relativenumber = true,
	cursorline = true,
	undodir = "/tmp",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

map('n', '<esc>', ':noh<CR>', { silent = true })

-- Custom Commands
create_command('Terminal', "belowright split term://zsh", { bang = true })
create_command('SpellCheck',
function(input)
	o.spell = true
	o.spellang = 'tr'
end, { bang = true }
)
create_command("WebsitePreview", [[execute "!firefox --new-window=file://%:p"]], { bang = true })
create_command("TexCreate", [[execute "!pdflatex '%' >/dev/null 2>&1" | redraw!]], { bang = true })
create_command("PoemCreate", [[w poem.txt | execute "!poemakegr '%' >/dev/null 2>&1" | redraw!]], { bang = true})
cmd([[
function WriteCreatingDirs()
	execute ':silent !mkdir -p %:h'
	write
endfunction
]])
create_command("W", "call WriteCreatingDirs()", { bang = true })


-- ooooooooooooo oooo                                              
-- 8'   888   `8 `888                                              
--      888       888 .oo.    .ooooo.  ooo. .oo.  .oo.    .ooooo.  
--      888       888P"Y88b  d88' `88b `888P"Y88bP"Y88b  d88' `88b 
--      888       888   888  888ooo888  888   888   888  888ooo888 
--      888       888   888  888    .o  888   888   888  888    .o 
--     o888o     o888o o888o `Y8bod8P' o888o o888o o888o `Y8bod8P' 
--
-- Status

cmd([[
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
]])

local slStr = {
	"  %f",
	"   ",
	" %l/%L",
	"    ",
	" %p%%",
	"   ",
	"%y %m",
	"%=",
	" %{&fileencoding?&fileencoding:&encoding}",
	"  ",
	"%{StatuslineGit()}",
}

o.statusline = table.concat(slStr)

-- Normal
cmd([[
colorscheme molokai
hi Normal cterm=NONE ctermbg=16
hi Pmenu cterm=NONE ctermfg=16 ctermbg=253
hi VertSplit cterm=NONE
hi SignColumn ctermbg=NONE ctermfg=209 cterm=NONE
hi SpellBad cterm=underline ctermfg=167 ctermbg=NONE
hi Search ctermbg=228 ctermfg=234 cterm=none
hi MatchParen ctermbg=238 ctermfg=72 cterm=NONE
hi StatusLine cterm=bold ctermfg=255 ctermbg=234
hi LineNr ctermfg=250 ctermbg=234
hi CursorLineNr ctermbg=240 ctermfg=255
hi CursorLine ctermbg=233
]])
-- coc colors
cmd([[
hi CocErrorSign ctermfg=16 ctermbg=161
hi CocWarningSign ctermfg=16 ctermbg=222
hi CocHintSign ctermfg=16 ctermbg=60
hi CocInfoSign ctermfg=16 ctermbg=60
]])
-- barbar
--- Current
cmd([[
hi BufferCurrent cterm=bold ctermbg=234 ctermfg=255 
hi BufferCurrentMod cterm=bold ctermbg=234 ctermfg=217
hi BufferCurrentSign cterm=bold ctermbg=234
]])
--- Visible
cmd([[
hi BufferVisible ctermbg=16 ctermfg=255 
hi BufferVisibleMod ctermbg=16 ctermfg=217
hi BufferVisibleSign ctermbg=16 ctermfg=255
]])
--- Inactive
cmd([[
hi BufferInactive ctermbg=16 ctermfg=242
hi BufferInactiveMod cterm=italic ctermbg=16 ctermfg=242
hi BufferInactiveSign ctermbg=16 ctermfg=242
]])
--- Tabpage
cmd([[
hi BufferTabpageFill ctermbg=16
hi BufferTabpage ctermbg=16
]])
