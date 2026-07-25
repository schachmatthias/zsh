#!/usr/bin/env zsh

set -eu

repo_dir="${0:A:h:h}"
fixture_home="$(mktemp -d "${TMPDIR:-/tmp}/matthias-zsh-test.XXXXXX")"
fixture_repo="$fixture_home/.config/zsh"

mkdir -p "$fixture_home/.config"
cp -R "$repo_dir" "$fixture_repo"

MATTHIAS_ZSH_HOME="$fixture_home" "$fixture_repo/install.zsh" --skip-plugins >/dev/null
MATTHIAS_ZSH_HOME="$fixture_home" "$fixture_repo/install.zsh" --skip-plugins >/dev/null

[[ -r "$fixture_home/.zshrc" ]]
[[ "$(grep -c 'source "$HOME/.config/zsh/index.zsh"' "$fixture_home/.zshrc")" == "1" ]]

print "installer tests passed"
