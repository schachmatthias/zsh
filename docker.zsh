startSmartHomeContainers() {
  if ! command -v docker >/dev/null 2>&1; then
    print -u2 "Docker is not installed."
    return 1
  fi

  local frontend="$HOME/coding-projects/smart-frontend"
  local backend="$HOME/coding-projects/smart-backend"
  [[ -d "$frontend" && -d "$backend" ]] || {
    print -u2 "Smart Home repositories are missing."
    return 1
  }

  print "Starting containers..."
  (cd "$frontend" && docker compose up --detach) &&
    (cd "$backend" && docker compose up --detach)
}

stopSmartHomeContainers() {
  if ! command -v docker >/dev/null 2>&1; then
    print -u2 "Docker is not installed."
    return 1
  fi

  local containers
  containers=("${(@f)$(docker ps -q)}")
  if (( ${#containers} == 0 )); then
    print "No running containers."
    return 0
  fi

  docker stop "${containers[@]}"
}

alias startSmartHome='startSmartHomeContainers'
alias stopSmartHome='stopSmartHomeContainers'
