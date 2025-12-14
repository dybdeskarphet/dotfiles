#!/bin/bash
cache="$HOME/.cache/logs/autostart"
mkdir -p "$cache"

_px() {
  pgrep -x "$@"
}

_px swww-daemon >/dev/null || swww-daemon >"$cache/swww-daemon.log" 2>&1 &
_px playerctld >/dev/null || playerctld >"$cache/playerctld.log" 2>&1 &
_px dunst >/dev/null || dunst -verbosity debug >"$cache/dunst.log" 2>&1 &
_px foot >/dev/null || foot --server >"$cache/foot_server.log" 2>&1 &
_px clipse >/dev/null || clipse --listen >"$cache/clipse.log" 2>&1 &
_px syshud >/dev/null || syshud >"$cache/syshud.log" 2>&1 &
_px openrazer-daemon >/dev/null || openrazer-daemon -Fv >"$cache/openrazer.log" 2>&1 &
_px swaybg >/dev/null || swaybg -i ~/img/.wallpaper_full_blur.png >"$cache/swaybg.log" 2>&1 &
_px keepassxc >/dev/null || base64 --decode ~/.local/share/secrets/keepassxc | keepassxc --minimized --pw-stdin ~/.local/share/keepassxc/Passwords.kdbx &
_px niri-genconfig || niri-genconfig daemon >"$cache/niri-genconfig.log" 2>&1 &
_px niriusd >"$cache/niriusd.log" 2>&1 &
