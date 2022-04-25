## Before You Use
- Some configs won't work out of the box (because of the required packages and absolute paths). Also most of the messages are in Turkish, change them according to your own language, paths and needs.
  - You can change usernames in absolute paths by running:
  ```
  change_username() { find . -type f -name "*" -print0 | xargs -0 sed -i "s/<your username>/$1/g" ; }
  ```
  - And you can change the usernames to your username with:
  ```
  change_username myusername
  ```
- Move `custom-icons` to `~/.local/share` for default script icons to work.
- You can change the fonts (for all programs) by just changing the `fontconfig/fonts.conf` file. If you want to use the default fonts, download and copy these to `~/.local/share/fonts`:
  - [Readex Pro](https://fonts.google.com/specimen/Readex+Pro)
  - [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete)
- And finally, you may want to use [my backup script](https://gist.github.com/dybdeskarphet/e3e4864fafd21d446d43d7b77f10057a#file-backup-sh) with these dots.

## Screenshot
<a href="https://unsplash.com/photos/PBhVmnIpGrc"><img src="screenshot.png"></a>
