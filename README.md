# Matthias' Zsh configuration

Portable Zsh configuration shared by macOS, Linux, and WSL.

## Fresh installation

Zsh and Git must already be available. On macOS they are provided by the Xcode
Command Line Tools.

```zsh
mkdir -p ~/.config
git clone https://github.com/schachmatthias/zsh.git ~/.config/zsh
~/.config/zsh/install.zsh
exec zsh
```

The installer:

- preserves an existing `.zshrc` and adds the loader only when missing;
- creates `.zshrc` from `zshrc.template` on a fresh account;
- installs Antigen into `~/.antigen` when necessary;
- can be run repeatedly;
- finishes with a compact environment diagnosis.

To configure the shell without downloading plugins:

```zsh
~/.config/zsh/install.zsh --skip-plugins
```

## Structure

- `index.zsh`: common environment, platform detection, plugins, and optional
  private configuration.
- `aliases.zsh`: common aliases plus guarded platform aliases.
- `docker.zsh`: optional Docker helpers with prerequisite checks.
- `platform/`: macOS, Linux, and WSL additions.
- `doctor.zsh`: compact installation diagnosis.
- `zshrc.template`: loader for a fresh home directory.
- `test/smoke.zsh`: dependency-free syntax and loading smoke tests.

Private files such as `variables.zsh` and `aliases-private.zsh` are loaded only
when present and remain ignored by Git.

## Node.js on a fresh Mac

After NVM has been installed:

```zsh
nvm install 24
nvm alias default 24
```

## Verification

```zsh
zsh -f test/smoke.zsh
zsh -f test/install.zsh
./doctor.zsh
```
