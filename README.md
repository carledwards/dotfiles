# dotfiles

Personal macOS dotfiles: zsh + [oh-my-zsh][] with the [Powerlevel10k][p10k]
prompt, Neovim, and a small set of modern CLI replacements (`eza`, `bat`,
`fd`, `ripgrep`, `fzf`, `zoxide`, `delta`).

Originally forked from [MrPickles/dotfiles][upstream].

## Install (new machine)

```shell
git clone https://github.com/carledwards/dotfiles.git ~/dev/carledwards/dotfiles
cd ~/dev/carledwards/dotfiles
./scripts/macos.sh   # Homebrew packages + Nerd Font
./setup.sh           # symlinks + oh-my-zsh, its theme, and plugins
```

Then set the terminal font to **MesloLGS NF** and open a new shell.

## Keeping machines in sync

Both Macs point at this repo. To pick up changes made on the other machine:

```shell
cd ~/dev/carledwards/dotfiles
git pull
./scripts/macos.sh   # only if the package list changed
./setup.sh           # only if files were added or removed
```

Because the dotfiles are symlinks into this repo, an edit to `~/.zshrc` *is* an
edit to `home/zshrc`. Commit and push it, and the other machine gets it on the
next `git pull` with no further steps.

## Layout

| Path              | Purpose                                                            |
| ----------------- | ------------------------------------------------------------------ |
| `home/`           | Symlinked to `~/.<name>` (e.g. `home/zshrc` → `~/.zshrc`)           |
| `config/`         | Symlinked to `~/.config/<name>` (e.g. `config/nvim` → `~/.config/nvim`) |
| `scripts/`        | Machine bootstrap                                                  |
| `setup.sh`        | Creates/removes the symlinks; installs oh-my-zsh and plugins       |

`setup.sh -t clean` removes every symlink it created. Existing files are backed
up to `<file>.<epoch>.bak` rather than overwritten.

## Machine-local overrides

Anything specific to one machine stays out of this repo. These are sourced if
present and are gitignored:

* `~/.zshrc.local` — extra `PATH` entries, per-machine aliases and env vars
* `~/.vimrc.local` — extra Vim config
* `~/.gitconfig` — identity; the shared config is included via `~/.main.gitconfig`

[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[p10k]: https://github.com/romkatv/powerlevel10k
[upstream]: https://github.com/MrPickles/dotfiles
