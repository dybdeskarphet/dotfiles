## Aliases 
alias inspac='paru -S'
alias uppac='paru -Syu'
alias upmirror='sudo reflector --verbose --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias rmpac='sudo pacman -Rs'
alias unspac='sudo pacman -Rcsn'
alias lspac='pacman -Qqe'
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias findpac='sudo pacman -Qs'

eval $(thefuck --alias)

alias r='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; echo "$LASTDIR" >> $HOME/.config/ranger/.dir_history; cd "$LASTDIR"'
alias ls='lsd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"'
alias todo='nvim ~/doc/notes/todo.md'
alias ls="g -icons"

alias vim="nvim"
alias svim="sudo nvim"
alias vi="nvim"

alias git='LANG=en_US.UTF-8 git'
alias gita='git add .'
alias gitd='git diff HEAD'
alias gitc='git commit -S'
alias gitp='git push'

alias q='exit'
alias :q='exit'

alias grep='grep --color=auto'

alias sd='shutdown now'
alias stfu='shutdown now'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias lock='xset dpms force suspend'
alias uefi='systemctl reboot --firmware-setup'

alias b='tput bel && ffplay -nodisp -autoexit -loglevel error /usr/share/sounds/freedesktop/stereo/complete.oga'

alias sensors="sensors | sed 's/.*hwmon.*/Wi-fi adapter:/g; s/.*k10.*/CPU:/g; s/amdgpu.*/GPU:/g; s/nvme.*/SSD:/g; s/vddgfx/GFX Core Voltage/g; s/vddnb/NB Voltage/g;'"

alias ff='bund -f'

alias toclipboard='xclip -sel clip'
alias ixio="curl -F 'f:1=<-' ix.io"
alias help="man zsh"

alias cal="LANG=tr_TR.UTF-8 cal"

alias dcn="discord & disown && exit"
alias scr="scrcpy --no-audio & disown && exit"

alias calc="rofi -show calc"

alias daktilo="daktilo --device pipewire"

#    .     ..
#  __|_  _ ||
# _) [ )(/,||
#

# completion
autoload -U compinit; compinit
zstyle ':completion:*' menu select

# command not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn

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

zstyle ':vcs_info:*' check-for-changes true

# set up the prompt (with git branch name)
setopt PROMPT_SUBST

# format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{yellow}%f%K{yellow}%F{16} %b%f%k%F{yellow}%f'

# prompt
export PS1="%F{yellow}%f%K{yellow}%F{16}%B%1~%b  %# %f%k%F{yellow}%f "
export PS2="%F{012}~%f "
export RPROMPT='${vcs_info_msg_0_} %(?,%F{green}%f,%F{11}%?%f %F{red}%f) %D{%K:%M:%S}'

# line editing
bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
