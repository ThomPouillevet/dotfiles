#!/usr/bin/env bash

# Install AeroSpace (from https://github.com/nikitabobko/AeroSpace)
echo "Installing AeroSpace..."
brew install --cask nikitabobko/tap/aerospace

# Create AeroSpace configuration directory
mkdir -p ~/.config/aerospace

# Symlink AeroSpace configuration
ln -fs ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml

echo "AeroSpace configuration complete!"
echo "Please restart AeroSpace to apply the new configuration."
