if uwsm check may-start; then
  exec uwsm start -- hyprland --config ~/.config/hypr/hyprland/init.conf
fi
