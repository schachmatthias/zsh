#!/usr/bin/env zsh

# Check the complete interactive startup, including the user's .zshrc additions.
export MATTHIAS_ZSH_SKIP_PLUGINS=1
export POWERLEVEL9K_INSTANT_PROMPT=off

zsh -ic '
  if [[ -n "${NVM_BIN:-}" && -x "$NVM_BIN/node" ]]; then
    if [[ "$(whence -p node)" != "$NVM_BIN/node" ]]; then
      print -u2 "node-runtime: selected NVM Node is shadowed by $(whence -p node)"
      exit 1
    fi
    print "Node runtime passed: $(whence -p node)"
  else
    print "Node runtime skipped: NVM has no selected runtime"
  fi
'
