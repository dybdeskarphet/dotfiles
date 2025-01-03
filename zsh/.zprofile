# no beep
setterm --blength=0

# start hyprland
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && Hyprland --config $HOME/.config/hypr/hyprland/init.conf >$HOME/.cache/logs/hyprland.log 2>&1
