# general
export EDITOR="nvim"
export VISUAL="nvim"
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
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export W3M_DIR="$XDG_STATE_HOME/w3m"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
export ANDROID_HOME="/opt/android-sdk/"
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

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
