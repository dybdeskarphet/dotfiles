# env
export EDITOR="nvim"
export VISUAL="nvim"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin:$HOME/code/sh:$HOME/.local/bin:
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export LESSHISTFILE=$XDG_CONFIG_HOME/less/history
export ADB_KEYS_PATH=$XDG_DATA_HOME/android
export _JAVA_AWT_WM_NONREPARENTING=1

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

# no beep
setterm --blength=0

# cd correction
shopt -s cdspell

# start x
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  startx > /dev/null 2>&1
fi

if [ "$TERM" = "linux" ]; then
  recolor() {
  /bin/echo -e "
  \e]P020201d
  \e]P1d73737
  \e]P260ac39
  \e]P3cfb017
  \e]P46684e1
  \e]P5b854d4
  \e]P61fad83
  \e]P7a6a28c
  \e]P87d7a68
  \e]P9d73737
  \e]PA60ac39
  \e]PBcfb017
  \e]PC6684e1
  \e]PDb854d4
  \e]PE1fad83
  \e]PFfefbec
  "
  }
  # get rid of artifacts
  recolor
  clear
  ufetch
  bundle -c
  echo

  alias r='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; cd "$LASTDIR"; recolor'

fi
