# ---------------------------
# Configuration directories
# ---------------------------
alias zshconfig='cd ~/.config/zsh'
alias nconfig='cd ~/.config/nvim && nvim'
alias tmuxconfig='cd ~/.config/tmux && nvim'
alias gitconfig='cd ~/.config/gitcustom'
alias gitcustom='cd ~/.config/gitcustom'

# ---------------------------
# Common directories
# ---------------------------
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'
alias coding='cd ~/coding-projects'
alias wissen='cd ~/Documents/wissen'
alias todos='nvim ~/Documents/todos.txt'
alias meetingnotes='nvim ~/Documents/meeting-notes.txt'

# ---------------------------
# Common commands
# ---------------------------
alias n='nvim'
alias e='exit'
alias c='clear'

[[ -x "$HOME/.local/bin/jupyter-notebook" ]] \
  && alias jupyter="$HOME/.local/bin/jupyter-notebook --no-browser"
[[ -x "$HOME/.config/zsh/update-vscode.sh" ]] \
  && alias vscodeupdate="$HOME/.config/zsh/update-vscode.sh"

case "${MATTHIAS_ZSH_PLATFORM:-unknown}" in
  wsl)
    # WSL configuration directories
    alias swayconfig='cd ~/.config/sway'
    alias alacrittyconfig='cd ~/.config/alacritty && nvim'

    # Windows directories
    alias windoc='cd /mnt/c/Users/$WIN_USER_NAME/Documents'
    alias winhome='cd /mnt/c/Users/$WIN_USER_NAME'
    alias windown='cd /mnt/c/Users/$WIN_USER_NAME/Downloads'
    alias winappdata='cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming'
    alias winautostart='cd "/mnt/c/Users/$WIN_USER_NAME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"'
    alias winalacritty='cd /mnt/c/Users/$WIN_USER_NAME/AppData/Roaming/Alacritty'

    # Windows applications and updates
    alias wezterm='"/mnt/c/Program Files/WezTerm/wezterm.exe"'
    alias winprogramfiles='cd "/mnt/c/Program Files"'
    alias winpowershellprofile='cd /mnt/c/Users/$WIN_USER_NAME/Documents/PowerShell'
    alias linupdate='sudo apt update && sudo apt upgrade -y'
    ;;
  macos)
    alias macupdate='softwareupdate --list'
    ;;
  linux)
    alias linupdate='sudo apt update && sudo apt upgrade -y'
    ;;
esac
