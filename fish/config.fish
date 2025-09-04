set fish_greeting
source $__fish_config_dir/env.fish

if status is-login
  if [ -z $WAYLAND_DISPLAY ] && [ $XDG_VTNR -eq 1 ]
      niri --session > $HOME/.cache/logs/autostart/niri.log 2>&1
  end
else if status is-interactive
  if test -s ~/doc/notes/todo.md
      glow ~/doc/notes/todo.md
  end
end
