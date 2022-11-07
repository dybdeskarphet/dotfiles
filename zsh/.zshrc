#    .             
#  _.|* _. __ _  __
# (_]||(_]_) (/,_) 
# 
# pacman
alias inspac='sudo pacman -S'
alias rmpac='sudo pacman -Rs'
alias unspac='sudo pacman -Rcsn'
alias lspac='pacman -Qqe'
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias findpac='sudo pacman -Qs'

# navigation
alias r='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; cd "$LASTDIR"'
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"'

# neovim
alias vim="nvim"
alias svim="sudo nvim"
alias vi="nvim"

# git aliases
alias git='LANG=en_US.UTF-8 git'
alias gita='git add .'
alias gitd='git diff HEAD'
alias gitc='git commit -S'
alias gitp='git push'

# ways to exit terminal
alias q='exit'
alias :q='exit'

# colorful grep 
alias grep='grep --color=auto'

# log out options
alias sd='shutdown now'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias lock='xset dpms force suspend && xsecurelock'
alias uefi='systemctl reboot --firmware-setup'

# bell
alias bell='tput bel && ffplay -nodisp -autoexit -loglevel error /usr/share/sounds/freedesktop/stereo/complete.oga'

# sensors
alias sensors="sensors | sed 's/.*hwmon.*/Wi-fi adapter:/g; s/.*k10.*/CPU/g'"

# ffsend
alias ff='bundle -f'
alias ffc='ffsend upload -c'

# clipboard
alias toclipboard='xclip -sel clip'
alias ixio="curl -F 'f:1=<-' ix.io"

# help command to man zsh
alias help="man zsh"

# adb shell
alias ads="adb shell"

# run kt
kt() { kotlinc "$1" && kotlin $(echo $1 | sed "s/\.kt/Kt\.class/g ; s/^\(.\)/\U\1/g"); }

# sudo to plz
alias please="sudo"

# turkish call
alias cal="LANG=tr_TR.UTF-8 cal"

#    .     ..
#  __|_  _ ||
# _) [ )(/,||
#
# completion
autoload -U compinit; compinit
zstyle ':completion:*' menu select

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
zstyle ':vcs_info:git:*' formats '%F{red}%f%K{red}%F{16} %b%f%k%F{red}%f'

# prompt
export PS1="%F{green}%f%K{green}%F{16}%B%1~%b  %# %f%k%F{green}%f "
export PS2="%F{012}~%f "
export RPROMPT='${vcs_info_msg_0_} %(?,%F{green}:%)%f,%F{11}%?%f %F{red}:(%f)'

# line editing
bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
