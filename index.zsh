#!/usr/bin/env zsh

typeset -g MATTHIAS_ZSH_DIR="${${(%):-%x}:A:h}"

# Add local tools before NVM selects Node so a local node shim cannot shadow it.
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

export BUN_INSTALL="${BUN_INSTALL:-$HOME/.bun}"
[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

matthias_zsh_platform="${MATTHIAS_ZSH_PLATFORM:-}"
if [[ -z "$matthias_zsh_platform" ]]; then
  case "$OSTYPE" in
    darwin*) matthias_zsh_platform="macos" ;;
    linux*)
      if [[ -r /proc/version ]] && grep -qi microsoft /proc/version; then
        matthias_zsh_platform="wsl"
      else
        matthias_zsh_platform="linux"
      fi
      ;;
    *) matthias_zsh_platform="unknown" ;;
  esac
fi
typeset -g MATTHIAS_ZSH_PLATFORM="$matthias_zsh_platform"
unset matthias_zsh_platform

[[ -r "$MATTHIAS_ZSH_DIR/platform/$MATTHIAS_ZSH_PLATFORM.zsh" ]] \
  && source "$MATTHIAS_ZSH_DIR/platform/$MATTHIAS_ZSH_PLATFORM.zsh"

if [[ "${MATTHIAS_ZSH_SKIP_PLUGINS:-0}" != "1" ]]; then
  antigen_script=""
  for candidate in \
    "$HOME/.antigen/antigen.zsh" \
    /usr/share/zsh-antigen/antigen.zsh \
    /opt/homebrew/share/antigen/antigen.zsh; do
    if [[ -r "$candidate" ]]; then
      antigen_script="$candidate"
      break
    fi
  done

  if [[ -n "$antigen_script" ]]; then
    source "$antigen_script"
    antigen use oh-my-zsh
    antigen bundle git
    antigen bundle composer
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle joshskidmore/zsh-fzf-history-search
    antigen theme romkatv/powerlevel10k
    antigen apply
  else
    print -u2 "matthias-zsh: Antigen is missing; run $MATTHIAS_ZSH_DIR/install.zsh"
  fi
  unset antigen_script candidate
fi

[[ -r "$MATTHIAS_ZSH_DIR/custom-keybinds.zsh" ]] \
  && source "$MATTHIAS_ZSH_DIR/custom-keybinds.zsh"
[[ -r "$MATTHIAS_ZSH_DIR/p10k.zsh" ]] \
  && source "$MATTHIAS_ZSH_DIR/p10k.zsh"

for optional_config in variables.zsh aliases-private.zsh private-projects.zsh; do
  [[ -r "$MATTHIAS_ZSH_DIR/$optional_config" ]] \
    && source "$MATTHIAS_ZSH_DIR/$optional_config"
done
unset optional_config
