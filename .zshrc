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
alias lsdu='du -mh --max-depth 1 | sort -rh'

# neovim
alias vim="nvim"
alias svim="sudo nvim"
alias vi="nvim"

# use git in english
alias git='LANG=en_US.UTF-8 git'

# ways to exit terminal
alias q='exit'
alias :q='exit'

# grep commands
alias grep='grep --color=auto'
alias searchforword="grep -rnw '/path/to/somewhere/' -e 'pattern'"

# log out options
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias lock='xset dpms force suspend && xsecurelock'
alias uefi='systemctl reboot --firmware-setup'

# bell
alias bell='tput bel && ffplay -nodisp -autoexit -loglevel error /usr/share/sounds/freedesktop/stereo/complete.oga'

# pipe the output to clipboard
alias toclipboard='xclip -sel clip'

# create snippet with ix.io (add this alias after a pipe)
alias ixio="curl -F 'f:1=<-' ix.io"

#    .     ..
#  __|_  _ ||
# _) [ )(/,||
#
# completion
autoload -U compinit; compinit
zstyle ':completion:*' menu select

# load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{003}%f%K{003}%F{016} %b%k%f%F{003}%f'
 
# set up the prompt (with git branch name)
setopt PROMPT_SUBST

# prompt
export PS1="%F{green}%f%K{green}%F{016}%B%1~ %b%# %f%k%F{green}%f "
export PS2="%F{012}~%f "
export RPROMPT='${vcs_info_msg_0_} %(?,%F{green}:%),%F{011}%? %F{red}:()%f'

# line editing
bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

if [ "$TERM" = "linux" ]; then
  zstyle ':vcs_info:git:*' formats '%F{003}(%b)%f'
  export PS1="%B%F{green}>%f %1~ %b%# "
fi
