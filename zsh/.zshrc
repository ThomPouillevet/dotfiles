# ===== ZSH CONFIGURATION =====
# This is the main ZSH configuration file optimized for Ruby on Rails development
# with modern tools and a productive development workflow

# ===== PATH CONFIGURATION =====
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ===== OH-MY-ZSH SETUP =====
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ===== THEME CONFIGURATION =====
# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"  # Classic, clean theme with git status

# ===== PLUGIN CONFIGURATION =====
# Useful plugins for Rails development with Cursor
# Each plugin provides specific functionality for development
# Note: Some plugins may be legacy (like 'sublime') but kept for compatibility
plugins=(
  gitfast          # Fast git aliases and functions
  git              # Git aliases and functions
  last-working-dir # Remember last working directory
  rails            # Rails aliases and functions
  bundler          # Bundler aliases and functions
  macos            # macOS specific aliases and functions
  docker           # Docker aliases and functions
  common-aliases   # Common command aliases
  sublime          # Sublime Text integration (legacy - can be removed if not using Sublime)
  history-substring-search   # Search history with arrow keys
  zsh-autosuggestions       # Command suggestions based on history
)

# ===== ENVIRONMENT VARIABLES =====
# Prevent Homebrew from reporting analytics
# https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Disable Spring (Rails application preloader) to avoid conflicts
export DISABLE_SPRING=true

# ===== OH-MY-ZSH LOADING =====
# Disable completion fix warnings
ZSH_DISABLE_COMPFIX=true

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Remove the 'rm' alias that makes it interactive by default
# (brought by plugins/common-aliases)
unalias rm

# ===== RUBY VERSION MANAGER SETUP =====
# Load mise or rbenv if installed (legacy support)
# export PATH="${HOME}/.rbenv/bin:${PATH}"
# type -a rbenv > /dev/null && eval "$(rbenv init -)"

# ===== PATH CONFIGURATION =====
# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin:/opt/homebrew/bin"

# ===== ALIASES LOADING =====
# Store your own aliases in the ~/.aliases file and load them here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# ===== ENCODING AND EDITOR CONFIGURATION =====
# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ===== EDITOR CONFIGURATION =====
# Set Cursor as the default editor for various tools
export EDITOR="cursor --wait"
export BUNDLER_EDITOR="cursor --wait"

# ===== PNPM CONFIGURATION =====
# PNPM package manager configuration
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# ===== GLOBAL ALIASES =====
# Rails development shortcuts
alias c="bundle exec rails c"                  # Rails console
alias s="bundle exec rails s"                  # Rails server
alias routes="bin/rails routes | fzf -e"       # Search Rails routes with fzf

# ===== GIT ALIASES =====
# Short, convenient aliases for common Git operations
alias gst="clear && git status"    # Clear screen and show git status
alias gs="gst"                     # Short alias for git status
alias undo="git reset HEAD\^"      # Undo last commit (keep changes)
alias gw="git worktree"            # Git worktree operations
alias gco="git checkout"           # Checkout branch

# ===== DEVELOPMENT ALIASES =====
# Process management with Overmind (for Rails development)
alias ovstart="overmind start -f Procfile.dev -r web"  # Start development server
alias ovquit="overmind quit"       # Quit overmind
alias ovdebug='overmind start -f Procfile.dev -l sidekiq_worker,sidekiq_worker_test_scenarios,mailcatcher,webpack'  # Start with specific processes

# ===== RUBY CONFIGURATION =====
# Ruby build configuration for better compatibility
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# ===== SYNTAX HIGHLIGHTING =====
# Load zsh-syntax-highlighting for better command line experience
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===== MYSQL CLIENT PATH =====
# Add MySQL client to PATH
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"
