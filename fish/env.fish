# fish
set -U fish_color_autosuggestion "#737373"
set -U zoxide_cmd z

# general
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx MESA_SHADER_CACHE_DISABLE true
set -gx WORDCHARS '*?_-.[]~=&;!#$%^(){}<>'
set -gx CM_LAUNCHER 'rofi'
set -gx ROFI_PASS_CONFIG "$HOME/.config/rofi-pass/config"

# xdg dirs
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_CACHE_HOME $HOME/.cache
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux XDG_STATE_HOME $HOME/.local/state
set -Ux XDG_DATA_DIRS "$XDG_DATA_HOME:/usr/share:/usr/local/share"

# change dir
set -gx GEM_HOME "$(gem env user_gemhome)"
set -gx ADB_KEYS_PATH $XDG_DATA_HOME/android
set -gx GNUPGHOME $XDG_CONFIG_HOME/gnupg
set -gx GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -gx LESSHISTFILE $XDG_CONFIG_HOME/less/history
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
set -gx RXVT_SOCKET "$XDG_RUNTIME_DIR"/urxvtd
set -gx W3M_DIR "$XDG_STATE_HOME/w3m"
set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -gx WINEPREFIX "$XDG_DATA_HOME"/wineprefixes/default
set -gx XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -gx JAVA_HOME "/usr/lib/jvm/java-17-openjdk/"
set -gx ANDROID_HOME "/opt/android-sdk"
set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -gx GOPATH "$XDG_DATA_HOME"/go
set -gx GOMODCACHE "$XDG_CACHE_HOME"/go/mod
set -gx NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages

# Use bat as less
set -x LESSOPEN "|/usr/bin/batpipe %s";
set -e LESSCLOSE;
set -x LESS "$LESS -R";
set -x BATPIPE "color";

# sudo prompt
set -gx SUDO_PROMPT (string join '' \
    (tput bold) (tput setaf 1) '' \
    (tput setab 1) (tput setaf 0) 'sudo' (tput sgr0) \
    (tput bold) (tput setaf 1) ' ' \
    (tput setaf 7) 'password for %u: ' (tput sgr0))

# path
set -gx PATH "/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$CARGO_HOME/bin:$GEM_HOME/bin:$HOME/code/system:$HOME/.local/share/bob/nvim-bin"

# history files
set -gx HISTFILE $ZDOTDIR/.zsh_history
set -gx HISTSIZE 1000
set -gx SAVEHIST 1000

# uwsm and app2unit
set -gx SCRIPT_SHARED_DIR "$XDG_DATA_HOME"/sysinfo
