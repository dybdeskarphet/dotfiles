# .zshrc Configuration File

## Aliases
### Package Management
alias inspac='paru -S'
alias uppac='paru -Syu'
alias upmirror='sudo reflector --verbose --latest 200 --sort age --save /etc/pacman.d/mirrorlist'
alias rmpac='sudo pacman -Rs'
alias unspac='sudo pacman -Rcsn'
alias lspac='pacman -Qqe'
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias findpac='sudo pacman -Qs'

### System and Utility Commands
alias sd='shutdown now'
alias stfu='shutdown now'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias lock='xset dpms force suspend && xsecurelock'
alias uefi='systemctl reboot --firmware-setup'
alias esupport='sudo dmidecode -t system | grep Serial | sed "s/.*:\ //g"'
alias toclipboard='xclip -sel clip'
alias ixio="curl -F 'f:1=<-' ix.io"
alias help="man zsh"
alias cal="LANG=tr_TR.UTF-8 cal"
alias sensors="sensors | sed 's/.*hwmon.*/Wi-fi adapter:/g; s/.*k10.*/CPU:/g; s/amdgpu.*/GPU:/g; s/nvme.*/SSD:/g; s/vddgfx/GFX Core Voltage/g; s/vddnb/NB Voltage/g;'"
alias grep='grep --color=auto'

### Navigation and File Management
alias r='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; echo "$LASTDIR" >> $HOME/.config/ranger/.dir_history; cd "$LASTDIR"'
alias ls='lsd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"'
alias notes='codium ~/doc/notes ~/doc/notes/todo.md'
alias ls="g -icons"
alias trash="gtrash"

### Applications with workarounds and shortcuts
alias dcn="discord & disown && exit"
alias scr="scrcpy --no-audio & disown && exit"
alias code="codium"

### Editor and Git Aliases
alias vim="nvim"
alias svim="sudo nvim"
alias vi="nvim"
alias gita='git add .'
alias gitd='git diff HEAD'
alias gitc='git commit -S'
alias gitp='git push'

### Bell in Terminal
alias bell='tput bel && ffplay -nodisp -autoexit -loglevel error /usr/share/sounds/freedesktop/stereo/complete.oga'
alias b='tput bel && ffplay -nodisp -autoexit -loglevel error /usr/share/sounds/freedesktop/stereo/complete.oga'

### Easy Exit
alias q='exit'
alias :q='exit'

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

export PS1="%F{magenta}%f%K{magenta}%F{16}%B%1~%b  %#%f%k%F{magenta}%f "
export PS2="%F{012}~%f "
export RPROMPT='${vcs_info_msg_0_} %(?,%F{green}%f,%F{yellow}%?%f %F{red}%f) %D{%K:%M:%S}'

## Key Bindings
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey -e

## External Script Sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Additional Configurations
setopt correct

# End of .zshrc
