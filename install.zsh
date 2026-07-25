#!/usr/bin/env zsh

set -eu

repo_dir="${0:A:h}"
target_home="${MATTHIAS_ZSH_HOME:-$HOME}"
target_dir="$target_home/.config/zsh"
zshrc="$target_home/.zshrc"
skip_plugins=0

if [[ "${1:-}" == "--skip-plugins" ]]; then
  skip_plugins=1
elif [[ -n "${1:-}" ]]; then
  print -u2 "Usage: ./install.zsh [--skip-plugins]"
  exit 2
fi

if [[ "$repo_dir" != "$target_dir" ]]; then
  print -u2 "Clone this repository to $target_dir before running the installer."
  print -u2 "Current location: $repo_dir"
  exit 1
fi

if [[ ! -e "$zshrc" ]]; then
  cp "$repo_dir/zshrc.template" "$zshrc"
  print "Created $zshrc"
elif ! grep -q 'source "$HOME/.config/zsh/index.zsh"' "$zshrc"; then
  {
    print
    print '# >>> matthias-zsh >>>'
    print 'source "$HOME/.config/zsh/index.zsh"'
    print 'source "$HOME/.config/zsh/aliases.zsh"'
    print 'source "$HOME/.config/zsh/docker.zsh"'
    print '# <<< matthias-zsh <<<'
  } >> "$zshrc"
  print "Added matthias-zsh loader to $zshrc"
else
  print "$zshrc is already configured"
fi

if (( ! skip_plugins )) && [[ ! -r "$target_home/.antigen/antigen.zsh" ]]; then
  if ! command -v git >/dev/null 2>&1; then
    print -u2 "Git is required to install Antigen."
    exit 1
  fi
  git clone --depth=1 https://github.com/zsh-users/antigen.git "$target_home/.antigen"
  print "Installed Antigen"
fi

"$repo_dir/doctor.zsh"
print
print "Installation complete. Run: exec zsh"
