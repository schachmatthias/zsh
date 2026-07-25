[[ -d /opt/nvim-linux64/bin ]] && path=("/opt/nvim-linux64/bin" $path)

export XDG_SESSION_TYPE="${XDG_SESSION_TYPE:-wayland}"
export XDG_CURRENT_DESKTOP="${XDG_CURRENT_DESKTOP:-sway}"
