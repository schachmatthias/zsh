#!/usr/bin/env zsh

set -eu

repo_dir="${0:A:h:h}"
export MATTHIAS_ZSH_SKIP_PLUGINS=1

for platform in macos linux wsl; do
  export MATTHIAS_ZSH_PLATFORM="$platform"
  source "$repo_dir/index.zsh"
  source "$repo_dir/aliases.zsh"
  source "$repo_dir/docker.zsh"
  [[ "$MATTHIAS_ZSH_PLATFORM" == "$platform" ]]
  alias coding >/dev/null
  typeset -f startSmartHomeContainers >/dev/null
done

print "smoke tests passed"
