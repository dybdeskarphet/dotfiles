#    .             
#  _.|* _. __ _  __
# (_]||(_]_) (/,_) 
 
# pacman
alias inspac='sudo pacman -S'
alias rmpac='sudo pacman -Rs'
alias unspac='sudo pacman -Rcsn'
alias lspac='pacman -Qqe'
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias findpac='sudo pacman -Qs'

# neovim
alias vim='nvim'
alias vi='nvim'
alias svim='sudo nvim'

# navigation
alias r='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; cd "$LASTDIR"'
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsdu='du -mh --max-depth 1 | sort -rh'

# use git in english
alias git='LANG=en_US.UTF-8 git'

# ways to exit terminal
alias q='exit'
alias :q='exit'

# colorful grep
alias grep='grep --color=auto'

# plays a sound when executed, useful with long-continued commands
alias bell="tput bel && ffplay -nodisp -autoexit -loglevel error /usr/share/sounds/freedesktop/stereo/complete.oga"

# log out options
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias lock='xset dpms force suspend && xsecurelock'

# pipe the output to clipboard
alias toclipboard='xclip -sel clip'

# create snippet with ix.io (add this alias after a pipe)
alias ixio="curl -F 'f:1=<-' ix.io"

#    .     ..
#  __|_  _ ||
# _) [ )(/,||
# 
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

export PS1="\[\e[1;32m\]> \[\e[1;39m\]\W \[\e[0;93m\]\$(parse_git_branch)\[\e[39m\]\$ "
export PS2="\[\e[0;94m\]~\[\e[0;39m\] "
