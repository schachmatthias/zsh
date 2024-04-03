#!/usr/bin/zsh

source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle composer
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k #you need to install powerline fonts for this theme (apt-get install powerline)
antigen apply
antigen bundle joshskidmore/zsh-fzf-history-search

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
