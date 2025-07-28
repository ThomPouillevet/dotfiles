#!/usr/bin/env bash

# ===== ZSH SETUP SCRIPT =====
# This script installs and configures Oh-My-Zsh with plugins
# optimized for Ruby on Rails development workflow

echo "Setting up ZSH with Oh-My-Zsh..."

# ===== INSTALL OH-MY-ZSH =====
# Install Oh-My-Zsh if not already installed
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# ===== COLOR DEFINITIONS =====
# Define colors for output formatting
REGULAR="\\033[0;39m"
YELLOW="\\033[1;33m"
GREEN="\\033[1;32m"

# ===== INSTALL ZSH PLUGINS =====
# Install additional ZSH plugins that enhance the development experience
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"

# Install zsh-syntax-highlighting for better command line experience
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  echo "       This plugin provides syntax highlighting for commands"
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi

cd "$CURRENT_DIR"

# ===== SYMLINK ZSH CONFIGURATION =====
# Ensure the main .zshrc file is properly linked
ln -fs ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "ZSH configuration complete!"
echo "Your ZSH is now configured with:"
echo "- Oh-My-Zsh framework"
echo "- Development-focused plugins"
echo "- Custom aliases and functions"
echo "- Syntax highlighting"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Test your new configuration"
echo "3. Customize plugins in ~/.zshrc if needed"
