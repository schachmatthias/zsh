source ~/.config/zsh/variables.zsh

#Config files
alias zshconfig='cd ~/.config/zsh'
alias swayconfig='cd ~/.config/sway'
alias nconfig='~/.config/nvim && nvim'
alias tmuxconfig='~/.config/tmux && nvim'
alias gitconfig='cd ~/.config/gitcustom/'
alias alacrittyconfig='cd ~/.config/alacritty && nvim'

#General Dirs
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'
alias coding='cd ~/coding-projects'
alias wissen='cd ~/Documents/wissen'
alias todos='nvim ~/Documents/todos.txt'
alias travel='cd ~/coding-projects/Urlaubsgesellschaft/'

#Win Dirs
alias windoc="cd /mnt/c/Users/$WIN_USER_NAME/Documents"
alias winhome="cd /mnt/c/Users/$WIN_USER_NAME"
alias windown="cd /mnt/c/Users/$WIN_USER_NAME/Downloads"
alias winappdata="cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming"
alias winautostart="cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming/Microsoft/Windows/'Start Menu'/Programs/Startup"

#Commands
alias n='nvim'
alias e='exit'

#Updates
alias vscodeupdate='~/.config/zsh/update-vscode.sh'
alias linupdate='sudo apt update && sudo apt upgrade -y'
