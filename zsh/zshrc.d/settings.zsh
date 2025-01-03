## Completion and Autoloads
autoload -U compinit; compinit
zstyle ':completion:*' menu select

## Load Version Control Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{yellow}%f%K{yellow}%F{16} %b%f%k%F{yellow}%f'

## Prompt Configuration
autoload -U compinit; compinit
setopt PROMPT_SUBST
zstyle ':completion:*' menu select

precmd() {
    vcs_info
    print -Pn "\e]0;zsh %(1j,%j job%(2j|s|); ,)%~\a"

}

_absolute_files () {
  local expansion=$PREFIX$SUFFIX; expansion=${(e)expansion}
  if [[ "${expansion%%/#}" != "${expansion:a}" ]]; then
    PREFIX="\$PWD/$PREFIX"
  fi
  _files "$@";
}

export PS1="%F{green}%f%K{green}%F{#151515}%B%1~%b  %#%f%k%F{green}%f "
export PS2="%F{012}~%f "
export RPROMPT='${vcs_info_msg_0_} %(?,%F{green}%f,%F{yellow}%?%f %F{red}%f) %D{%K:%M:%S}'

## Key Bindings
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey -e

## External Script Sources
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

## Additional Configurations
setopt correct
setopt interactive_comments
ZSH_HIGHLIGHT_STYLES[comment]="fg=#ffffb3"
