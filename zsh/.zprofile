# no beep
setterm --blength=0

# start x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx > $HOME/.cache/startx.log 2>&1
