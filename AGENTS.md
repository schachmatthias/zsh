# Zsh configuration guidance

This repository is shared by macOS, Linux, and WSL installations.

- Keep common configuration portable and put platform-specific behavior in
  `platform/<platform>.zsh`.
- Never assume Homebrew, apt, Docker, Bun, NVM, Neovim, or private configuration
  files are installed.
- Keep `install.zsh` idempotent and safe for an existing `.zshrc`.
- Do not commit `variables.zsh`, `aliases-private.zsh`, or other secrets.
- Run `zsh -f test/smoke.zsh` and `zsh -f test/install.zsh` after changes.
