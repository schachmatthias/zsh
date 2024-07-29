#Config files
alias zshconfig='cd ~/.config/zsh'
alias swayconfig='cd ~/.config/sway'
alias nconfig='~/.config/nvim && nvim'
alias tmuxconfig='~/.config/tmux && nvim'
alias gitconfig='cd ~/.config/gitcustom/'

#General Dirs
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'
alias coding='cd ~/coding-projects'
alias wissen='cd ~/Documents/wissen'
alias todos='nvim ~/Documents/todos.txt'
alias travel='cd ~/coding-projects/Travelbuddy/'

#Commands
alias n='nvim'
alias e='exit'
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

#Updates
alias vscodeupdate='~/.config/zsh/update-vscode.sh'
alias linupdate='sudo apt update && sudo apt upgrade'
