#!/usr/bin/env bash

# Installs the Homebrew packages these dotfiles expect, plus a couple of macOS
# defaults. Safe to re-run; that's how a second machine is brought in sync.

set -u

if [[ $(uname) != "Darwin" ]]; then
  echo "This script should be run on MacOS only."
  exit 1
fi

# Remove hide delay for the dock
# https://apple.stackexchange.com/a/46222
defaults write com.apple.Dock autohide-delay -float 0
killall Dock

if [[ -z "$(command -v brew)" ]]; then
  # Install Homebrew.
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

# Command-line tools referenced by the shell config.
brew install \
  bat \
  eza \
  fd \
  fzf \
  git-delta \
  git-lfs \
  jq \
  neovim \
  ripgrep \
  zoxide

# Powerlevel10k needs a Nerd Font for its glyphs.
brew install --cask font-meslo-lg-nerd-font
