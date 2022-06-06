# env
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$HOME/code/sh/eye-candy:$HOME/code/sh/notify:$HOME/code/sh/tools:$HOME/code/py/tools:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export ZDOTDIR=$HOME/.zsh
export HISTFILE=$HOME/.zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export _JAVA_AWT_WM_NONREPARENTING=1
export MESA_SHADER_CACHE_DISABLE=true
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# colorful pager
export LESS_TERMCAP_mb=$'\e[01;31m'		# begin blinking
export LESS_TERMCAP_md=$'\e[01;32m'		# begin bold
export LESS_TERMCAP_me=$'\e[0m'			# end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se=$'\e[0m'			# end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;16;48;5;5m'	# start standout mode
export LESS_TERMCAP_ue=$'\e[0m'			# end underline
export LESS_TERMCAP_us=$'\e[4;93m'		# start underlining

# xsecurelock
export XSECURELOCK_PASSWORD_PROMPT='time'
export XSECURELOCK_COMPOSITE_OBSCURER=0
export XSECURELOCK_SHOW_DATETIME=1
