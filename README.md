My own zsh configuration divided into separate files to enhance overall organization and ease of understanding.

In order to make this work create .zshrc file in home directory and source those files. P10K should be on top for initial loading.

something like this:

```

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/index.zsh
source ~/.config/zsh/wgs.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/docker.zsh

```

Antigen needs to be installed on the system
```
sudo apt-get install zsh-antigen

```


