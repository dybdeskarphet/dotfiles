# general
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:"
export _JAVA_AWT_WM_NONREPARENTING=1
export MESA_SHADER_CACHE_DISABLE=true
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# xdg dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# change dir 
export ADB_KEYS_PATH=$XDG_DATA_HOME/android
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# history files
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# colorful pager
export LESS_TERMCAP_mb=$'\e[01;31m'		# begin blinking
export LESS_TERMCAP_md=$'\e[01;32m'		# begin bold
export LESS_TERMCAP_me=$'\e[0m'			# end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se=$'\e[0m'			# end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;16;48;5;5m'	# start standout mode
export LESS_TERMCAP_ue=$'\e[0m'			# end underline
export LESS_TERMCAP_us=$'\e[4;93m'		# start underlining
