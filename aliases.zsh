# Load configuration and private aliases
source ~/.config/zsh/variables.zsh
source ~/.config/zsh/aliases-private.zsh

# ---------------------------
# Config Files Aliases
# ---------------------------
alias zshconfig='cd ~/.config/zsh'
alias swayconfig='cd ~/.config/sway'
alias nconfig='cd ~/.config/nvim && nvim'
alias tmuxconfig='cd ~/.config/tmux && nvim'
alias gitconfig='cd ~/.config/gitcustom'
alias alacrittyconfig='cd ~/.config/alacritty && nvim'
alias gitcustom='cd ~/.config/gitcustom'

# ---------------------------
# General Directories
# ---------------------------
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'
alias coding='cd ~/coding-projects'
alias wissen='cd ~/Documents/wissen'
alias todos='nvim ~/Documents/todos.txt'
alias meetingnotes='nvim ~/Documents/meeting-notes.txt'
alias wgsAgent='cd ~/coding-projects/wgs-agent-workflows'

# ---------------------------
# Windows Directories (WSL)
# ---------------------------
alias windoc="cd /mnt/c/Users/$WIN_USER_NAME/Documents"
alias winhome="cd /mnt/c/Users/$WIN_USER_NAME"
alias windown="cd /mnt/c/Users/$WIN_USER_NAME/Downloads"
alias winappdata="cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming"
alias winautostart="cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming/Microsoft/Windows/'Start Menu'/Programs/Startup"
alias winalacritty="cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming/Alacritty"

# ---------------------------
# Windows Applications
# ---------------------------
alias wezterm='"/mnt/c/Program Files/WezTerm/wezterm.exe"'
alias winprogramfiles="cd /mnt/c/'Program Files'/"
alias winpowershellprofile="cd /mnt/c/Users/$WIN_USER_NAME/Documents/PowerShell"

# ---------------------------
# Common Commands
# ---------------------------
alias n='nvim'
alias e='exit'
alias jupyter="~/.local/bin/jupyter-notebook --no-browser"
alias c="clear"

# ---------------------------
# Update Commands
# ---------------------------
alias vscodeupdate='~/.config/zsh/update-vscode.sh'
alias linupdate='sudo apt update && sudo apt upgrade -y'
