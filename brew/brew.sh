#!/usr/bin/env bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH (compatible with both Intel and Apple Silicon)
    if [[ $(uname -m) == "arm64" ]]; then
        # Apple Silicon (M1/M2) - primary path
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        # Intel Mac - primary path
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Update Homebrew
brew update

# Install essential development tools
echo "Installing development tools..."
brew install \
    git \
    mise \
    postgresql@14 \
    redis \
    docker \
    docker-compose \
    bat \
    curl

# Install essential applications
echo "Installing applications..."
brew install --cask \
    cursor \
    iterm2 \
    brave-browser \
    slack \
    docker \
    tableplus \
    ngrok \
    jordanbaird-ice \
    raycast

# Install fonts
echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask \
    font-fira-code

# Install macOS App Store applications
echo "Installing macOS App Store applications..."
mas install 497799835  # Xcode

# Clean up
brew cleanup

echo "Homebrew installation complete!"
echo "Don't forget to:"
echo "1. Set up your SSH keys"
echo "2. Configure Git"
echo "3. Install AeroSpace"
echo "4. Configure Cursor preferences"
