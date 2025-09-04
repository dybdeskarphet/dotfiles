function sudo
    command sudo -v
    command sudo $argv
end

function ffsend
  set url $(/usr/bin/ffsend upload -q "$argv")
  qrencode -t UTF8 --foreground=000000 --background=ffffff -l M -s 20 $url
  echo "Copied to clipboard: $url"
  wl-copy "$url"
end

function r
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function uppac
    printf '%b\n' "\e[32m:: \e[0mImportant updates:"
    checkupdates | grep -Ff ~/.config/paru/important_packages.txt
    echo
    paru
end

function esupport
    set ESUPPORT (sudo dmidecode -t system | grep Serial | sed 's/.*:\ //g')
    echo $ESUPPORT | wl-copy
    echo "Copied to clipboard: $ESUPPORT"
end

function dpkgb
    git clone --branch $argv[1] --single-branch https://github.com/archlinux/aur.git $argv[1]
end

alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias :q='exit'
alias Q='exit'
alias acvpip="source .venv/bin/activate"
alias b='tput bel'
alias bell='tput bel'
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias cr='cargo run'
alias df="duf"
alias dir="ls"
alias find="fd"
alias findpac='sudo pacman -Qs'
alias gita='git add .'
alias gitc='git commit -S'
alias gitd='git diff HEAD'
alias gitp='git push'
alias godsays='curl "https://godsays.xyz/"'
alias grep="rg"
alias hibernate='systemctl hibernate'
alias hyprpicker="hyprpicker -a"
alias inspac='paru -S'
alias ixio="curl -F 'f:1=<-' ix.io"
alias lock='key-scripts -l'
alias ls="lsd --color=auto --hyperlink=auto -Fl"
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"'
alias lspac='pacman -Qqe'
alias lsserv='systemctl list-unit-files --state=enabled'
alias man="batman"
alias mkpc='makepkg -g >> PKGBUILD'
alias mkps='makepkg --printsrcinfo > .SRCINFO'
alias npm="echo 'Run bun'"
alias pac='paru'
alias q='exit'
alias qq='exit'
alias rm="rm -i"
alias rmpac='sudo pacman -Rs'
alias scr="scrcpy --keyboard=uhid --no-audio & disown && exit"
alias sd='shutdown now'
alias sensors="sensors | sed 's/.*hwmon.*/Wi-fi adapter:/g; s/.*k10.*/CPU:/g; s/amdgpu.*/GPU:/g; s/nvme.*/SSD:/g; s/vddgfx/GFX Core Voltage/g; s/vddnb/NB Voltage/g;'"
alias suspend='systemctl suspend'
alias svim="sudo nvim"
alias to0x0="0x0 -"
alias toclipboard='wl-copy'
alias todo="nvim ~/doc/notes/todo.md"
alias trash-empty="gtrash prune --day 0"
alias trash-restore="gtrash restore"
alias trash="gtrash"
alias tty-clock="termdown -f gothic -z -Z "%H:%M""
alias uefi='systemctl reboot --firmware-setup'
alias unspac='sudo pacman -Rcsn'
alias upmirror='sudo reflector --verbose --protocol https --latest 50 --sort rate --download-timeout 60 --save /etc/pacman.d/mirrorlist'
alias vi="nvim"
alias vim="nvim"
alias watchprog="sudo watch -n 0.1 progress"
alias watchsync="sudo watch -d grep -e Dirty: -e Writeback: /proc/meminfo"
alias y='r'
alias ytgetplaylist="yt-dlp --flat-playlist --print title"
