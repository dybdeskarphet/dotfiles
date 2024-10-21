# .zshrc Configuration File

## Aliases
### Package Management
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias findpac='sudo pacman -Qs'
alias inspac='paru -S'
alias lspac='pacman -Qqe'
alias rmpac='sudo pacman -Rs'
alias unspac='sudo pacman -Rcsn'
alias upmirror='sudo reflector --verbose --protocol https --latest 50 --sort rate --download-timeout 60 --save /etc/pacman.d/mirrorlist'
alias uppac='paru -Syu'
alias mkps='makepkg --printsrcinfo > .SRCINFO'
alias mkpc='makepkg -g >> PKGBUILD'

### System and Utility Commands
alias cal="LANG=tr_TR.UTF-8 cal"
alias grep='grep --color=auto'
alias help="man zsh"
alias hibernate='systemctl hibernate && slock'
alias ixio="curl -F 'f:1=<-' ix.io"
alias to0x0="0x0 -"
alias lock='xset dpms force suspend && slock'
alias {stfu,sd}='shutdown now'
alias suspend='systemctl suspend && slock'
alias toclipboard='xclip -selection c'
alias uefi='systemctl reboot --firmware-setup'
alias lsserv='systemctl list-unit-files --state=enabled'
alias sudo='sudo -v; sudo '

### Navigation and File Management
# alias unrar="unrar-free"
function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias y='r'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias ls="lsd --color=auto"
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"'
alias rm="rm -i"
alias trash-empty="gtrash prune --day 0"
alias trash-restore="gtrash restore"
alias trash="gtrash"

### Applications with workarounds and shortcuts
alias scr="scrcpy --keyboard=uhid --no-audio & disown && exit"
alias tty-clock="termdown.py -f larry3d -z -Z "%H:%M""
alias watchsync="sudo watch -d grep -e Dirty: -e Writeback: /proc/meminfo"
alias watchprog="sudo watch -n 0.1 progress"
alias termux="adb forward tcp:8022 tcp:8022 && adb forward tcp:8080 tcp:8080 && ssh localhost -p 8022"
alias godsays='curl "https://godsays.xyz/"'
alias cr='cargo run'
alias screenkey='screenkey -s large --scr 1 -p bottom --geometry 200x150+10-1020'
alias udiskie-dmenu='UDISKIE_DMENU_LAUNCHER="rofi" udiskie-dmenu -matching regex -dmenu -i -no-custom -multi-select'

### Open with devour
alias feh='devour feh'
alias mpv='devour mpv'
alias zathura='devour zathura'
alias gimp='devour gimp'
alias kdenlive='devour kdenlive'
alias alacrittynvim='devour alacrittynvim'

### Editor and Git Aliases
alias gita='git add .'
alias gitc='git commit -S'
alias gitd='git diff HEAD'
alias gitp='git push'
alias svim="sudo nvim"
alias {vi,vim}="nvim"

### Bell in Terminal
alias {bell,b}='tput bel && paplay /usr/share/sounds/freedesktop/stereo/complete.oga'

### Easy Exit
alias {q,:q,Q,qq}='exit'

## Completion and Autoloads
autoload -U compinit; compinit
zstyle ':completion:*' menu select

## Load Version Control Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{yellow}%f%K{yellow}%F{16} %b%f%k%F{yellow}%f'

## Prompt Configuration
autoload -U compinit; compinit
setopt PROMPT_SUBST
zstyle ':completion:*' menu select

precmd() {
    vcs_info
    print -Pn "\e]0;zsh %(1j,%j job%(2j|s|); ,)%~\a"

}

_absolute_files () {
  local expansion=$PREFIX$SUFFIX; expansion=${(e)expansion}
  if [[ "${expansion%%/#}" != "${expansion:a}" ]]; then
    PREFIX="\$PWD/$PREFIX"
  fi
  _files "$@";
}

export PS1="%F{green}%f%K{green}%F{#151515}%B%1~%b  %#%f%k%F{green}%f "
export PS2="%F{012}~%f "
export RPROMPT='${vcs_info_msg_0_} %(?,%F{green}%f,%F{yellow}%?%f %F{red}%f) %D{%K:%M:%S}'

## Key Bindings
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey -e

## External Script Sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh

## Additional Configurations
setopt correct
setopt interactive_comments
ZSH_HIGHLIGHT_STYLES[comment]="fg=#ffffb3"
