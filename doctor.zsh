#!/usr/bin/env zsh

set -u

repo_dir="${0:A:h}"
target_home="${MATTHIAS_ZSH_HOME:-$HOME}"
platform="${MATTHIAS_ZSH_PLATFORM:-}"
if [[ -z "$platform" ]]; then
  case "$OSTYPE" in
    darwin*) platform="macos" ;;
    linux*)
      if [[ -r /proc/version ]] && grep -qi microsoft /proc/version; then
        platform="wsl"
      else
        platform="linux"
      fi
      ;;
    *) platform="unknown" ;;
  esac
fi

check() {
  local label="$1"
  local value="$2"
  printf '%-14s %s\n' "$label" "$value"
}

check platform "$platform"
check architecture "$(uname -m)"
check repository "$repo_dir"
check zshrc "$([[ -r "$target_home/.zshrc" ]] && print configured || print missing)"
check antigen "$([[ -r "$target_home/.antigen/antigen.zsh" || -r /usr/share/zsh-antigen/antigen.zsh ]] && print available || print missing)"
check nvm "$([[ -r "$target_home/.nvm/nvm.sh" ]] && print available || print missing)"
check node "$(command -v node >/dev/null 2>&1 && node --version || print missing)"
check git "$(command -v git >/dev/null 2>&1 && git --version || print missing)"
