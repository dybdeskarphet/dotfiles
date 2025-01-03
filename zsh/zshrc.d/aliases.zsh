## Aliases
### Package Management
alias clpac='sudo pacman -Qtdq | sudo pacman -Rns -'
alias findpac='sudo pacman -Qs'
alias inspac='paru -S'
alias lspac='pacman -Qqe'
alias rmpac='sudo pacman -Rs'
alias unspac='sudo pacman -Rcsn'
alias upmirror='sudo reflector --verbose --protocol https --latest 50 --sort rate --download-timeout 60 --save /etc/pacman.d/mirrorlist'
function uppac() {
  printf '%b\n' "\e[32m:: \e[0mImportant updates:"
  checkupdates | grep -Ff ~/.config/paru/important_packages.txt
  echo
  paru -Syu
}
alias mkps='makepkg --printsrcinfo > .SRCINFO'
alias mkpc='makepkg -g >> PKGBUILD'

### System and Utility Commands
alias cal="LANG=tr_TR.UTF-8 cal"
alias esupport='ESUPPORT=$(sudo dmidecode -t system | grep Serial | sed "s/.*:\ //g"); echo "$ESUPPORT" | wl-copy; echo "Copied to clipboard: $ESUPPORT"'
alias grep='grep --color=auto'
alias help="man zsh"
alias hibernate='systemctl hibernate'
alias ixio="curl -F 'f:1=<-' ix.io"
alias to0x0="0x0 -"
alias lock='key-scripts -l'
alias sensors="sensors | sed 's/.*hwmon.*/Wi-fi adapter:/g; s/.*k10.*/CPU:/g; s/amdgpu.*/GPU:/g; s/nvme.*/SSD:/g; s/vddgfx/GFX Core Voltage/g; s/vddnb/NB Voltage/g;'"
alias {stfu,sd}='shutdown now'
alias suspend='systemctl suspend'
alias toclipboard='wl-copy'
alias uefi='systemctl reboot --firmware-setup'
alias lsserv='systemctl list-unit-files --state=enabled'
alias sudo='sudo -v; sudo '

### Navigation and File Management
function r() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

alias y='r'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias ls="lsd --color=auto"
alias lsdu='du -mh --max-depth 1 | sort -rh | sed "s/\.\///g"'
alias rm="rm -i"
alias trash-empty="gtrash prune --day 0"
alias trash-restore="gtrash restore"
alias trash="gtrash"

### Applications with workarounds and shortcuts
alias scr="scrcpy --keyboard=uhid --no-audio & disown && exit"
alias tty-clock="termdown.py -f larry3d -z -Z "%H:%M""
alias watchsync="sudo watch -d grep -e Dirty: -e Writeback: /proc/meminfo"
alias watchprog="sudo watch -n 0.1 progress"
alias termux="adb forward tcp:8022 tcp:8022 && adb forward tcp:8080 tcp:8080 && ssh localhost -p 8022"
alias godsays='curl "https://godsays.xyz/"'
alias cr='cargo run'
alias acvpip="source .venv/bin/activate"

### Editor and Git Aliases
alias gita='git add .'
alias gitc='git commit -S'
alias gitd='git diff HEAD'
alias gitp='git push'
alias svim="sudo nvim"
alias {vi,vim}="nvim"

### Bell in Terminal
alias {bell,b}='tput bel'

### Easy Exit
alias {q,:q,Q,qq}='exit'
