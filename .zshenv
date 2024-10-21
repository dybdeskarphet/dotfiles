# general
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export EDITOR="nvim"
export VISUAL="nvim"
export _JAVA_AWT_WM_NONREPARENTING=1
export MESA_SHADER_CACHE_DISABLE=true
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export CM_LAUNCHER='rofi'
export ROFI_PASS_CONFIG="$HOME/.config/rofi-pass/config"

# Themeing
export QT_STYLE_OVERRIDE=kvantum
export SUDO_PROMPT="$(tput bold)$(tput setaf 5)$(tput setab 5)$(tput setaf 0)sudo$(tput sgr0)$(tput bold)$(tput setaf 5) $(tput setaf 7)password for %u:$(tput sgr0) "

# xdg dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

# change dir
export ADB_KEYS_PATH=$XDG_DATA_HOME/android
export ANDROID_HOME="/opt/android-sdk/"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk/"
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export W3M_DIR="$XDG_STATE_HOME/w3m"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# history files
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# colorful pager
export LESS_TERMCAP_mb=$'\e[01;31m'          # begin blinking
export LESS_TERMCAP_md=$'\e[01;32m'          # begin bold
export LESS_TERMCAP_me=$'\e[0m'              # end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se=$'\e[0m'              # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;16;48;5;5m' # start standout mode
export LESS_TERMCAP_ue=$'\e[0m'              # end underline
export LESS_TERMCAP_us=$'\e[4;93m'           # start underlining
