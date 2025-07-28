#!/usr/bin/env bash

# Create Cursor configuration directory
mkdir -p ~/Library/Application\ Support/Cursor/User

# Symlink Cursor settings (migrated from VS Code)
ln -fs ~/dotfiles/cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
ln -fs ~/dotfiles/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json

echo "Cursor configuration complete!"
echo "Note: These settings were migrated from VS Code and represent your current preferences."
