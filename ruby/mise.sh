#!/usr/bin/env bash

# ===== MISE RUBY ENVIRONMENT SETUP =====
# This script sets up mise (formerly rtx) for Ruby version management
# Mise is a modern, fast alternative to rbenv/rvm with better performance
# and support for multiple languages and tools

echo "Setting up mise for Ruby development environment..."

# ===== CLEANUP OLD RUBY MANAGERS =====
# Remove old Ruby version managers to avoid conflicts
echo "Cleaning up old Ruby installations..."

# Remove RVM if present
if command -v rvm &> /dev/null; then
    echo "Removing RVM..."
    rvm implode && sudo rm -rf ~/.rvm 2>/dev/null || true
fi

# Remove rbenv if present
if command -v rbenv &> /dev/null; then
    echo "Removing rbenv..."
    sudo rm -rf $HOME/.rbenv /usr/local/rbenv /opt/rbenv /usr/local/opt/rbenv 2>/dev/null || true
    brew uninstall --force rbenv ruby-build 2>/dev/null || true
fi

# Remove asdf if present (another version manager)
if command -v asdf &> /dev/null; then
    echo "Removing asdf..."
    rm -rf ~/.asdf 2>/dev/null || true
fi

# ===== INSTALL MISE =====
echo "Installing mise..."

# Check if mise is already installed
if ! command -v mise &> /dev/null; then
    # Install mise using the official installer
    curl https://mise.run | sh

    # Add mise to shell configuration
    echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
    echo 'eval "$(mise activate bash)"' >> ~/.bashrc

    # Source the updated shell configuration
    source ~/.zshrc 2>/dev/null || source ~/.bashrc 2>/dev/null
else
    echo "mise is already installed, updating..."
    mise self-update
fi

# ===== CONFIGURE MISE =====
echo "Configuring mise..."

# Set up global configuration
mise settings set legacy_version_file true    # Support .ruby-version files
mise settings set experimental true           # Enable experimental features
mise settings set jobs 4                      # Number of parallel jobs for installations

# ===== INSTALL RUBY VERSIONS =====
echo "Installing Ruby versions..."

# Install modern Ruby versions commonly used in Rails development
mise install ruby@3.2.2                       # Ruby 3.2.2 (LTS)
mise install ruby@3.3.0                       # Ruby 3.3.0 (Latest stable)
mise install ruby@3.3.1                       # Ruby 3.3.1 (Latest patch)

# Set global default Ruby version
mise global ruby@3.3.1

# ===== INSTALL ESSENTIAL GEMS (pick what you need) =====
echo "Installing essential gems..."

# Development and debugging gems
gem install bundler                           # Package manager for Ruby
gem install rake                              # Task automation tool
gem install pry                               # Enhanced REPL
gem install pry-byebug                        # Debugging for pry
gem install pry-rails                         # Rails integration for pry
gem install awesome_print                     # Pretty printing for Ruby objects

# Testing gems
gem install rspec                             # Testing framework
gem install factory_bot_rails                 # Test data factories
gem install database_cleaner                  # Database cleaning for tests
gem install shoulda-matchers                  # Test matchers
gem install webmock                           # HTTP request mocking
gem install vcr                               # HTTP interaction recording
gem install timecop                           # Time manipulation for tests
gem install faker                             # Fake data generation

# Code quality and analysis gems
gem install rubocop                           # Ruby code style checker
gem install rubocop-performance               # Performance-focused RuboCop rules
gem install rubocop-rails                     # Rails-specific RuboCop rules
gem install reek                              # Code smell detector
gem install flay                              # Code duplication detector
gem install flog                              # Code complexity analyzer
gem install fasterer                          # Performance suggestions
gem install debride                           # Dead code detector
gem install rubycritic                        # Code quality reporter
gem install brakeman                          # Security vulnerability scanner
gem install bundler-audit                     # Security audit for gems

# Rails and web development
gem install rails                             # Web application framework
gem install overmind                          # Process manager for development
gem install foreman                           # Process manager (alternative)
gem install dotenv                            # Environment variable management

# Documentation and development tools
gem install solargraph                        # Language server for Ruby
gem install yard                              # Documentation generator
gem install octokit                           # GitHub API client
gem install colored                           # Colorized output

# ===== CONFIGURE BUNDLER =====
echo "Configuring Bundler..."

# Set Bundler to use the current Ruby version
bundle config set --local path 'vendor/bundle'
bundle config set --local build.nokogiri --use-system-libraries

# ===== CREATE RUBY CONFIGURATION FILES =====
echo "Creating Ruby configuration files..."

# Create .irbrc for enhanced IRB experience
cat > ~/.irbrc << 'EOF'
# Enhanced IRB configuration for better development experience

# Load awesome_print for pretty printing
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  # awesome_print not available, continue without it
end

# Set IRB prompt
IRB.conf[:PROMPT_MODE] = :SIMPLE

# Enable history
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# Enable auto-indent
IRB.conf[:AUTO_INDENT] = true

# Load Rails environment if in Rails project
if defined?(Rails)
  puts "Rails environment loaded!"
end
EOF

# Create .pryrc for enhanced Pry experience
cat > ~/.pryrc << 'EOF'
# Enhanced Pry configuration for debugging and development

# Load awesome_print for pretty printing
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
  # awesome_print not available, continue without it
end

# Set Pry prompt
Pry.config.prompt = [
  proc { |obj, nest_level, _| "pry(#{obj.class})#{':' + nest_level.to_s if nest_level > 0}> " },
  proc { |obj, nest_level, _| "pry(#{obj.class})#{':' + nest_level.to_s if nest_level > 0}* " }
]

# Enable history
Pry.config.history.file = "#{ENV['HOME']}/.pry_history"
Pry.config.history.should_save = true
Pry.config.history.should_load = true

# Enable auto-indent
Pry.config.auto_indent = true

# Load Rails environment if in Rails project
if defined?(Rails)
  puts "Rails environment loaded in Pry!"
end
EOF

# ===== SET UP ENVIRONMENT VARIABLES =====
echo "Setting up environment variables..."

# Add Ruby configuration to shell profile
cat >> ~/.zshrc << 'EOF'

# ===== RUBY DEVELOPMENT ENVIRONMENT =====
# Ruby configuration for development
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"
export BUNDLER_EDITOR="cursor --wait"
export DISABLE_SPRING=true

# Mise (Ruby version manager) configuration
eval "$(mise activate zsh)"
EOF

# ===== VERIFY INSTALLATION =====
echo "Verifying installation..."

# Check Ruby version
echo "Current Ruby version: $(ruby -v)"
echo "Current gem list: $(gem list | wc -l) gems installed"

# Test mise functionality
echo "Testing mise functionality..."
mise list ruby

# ===== COMPLETION MESSAGE =====
echo ""
echo "✅ Ruby development environment setup complete!"
echo ""
echo "What was installed:"
echo "- mise (modern Ruby version manager)"
echo "- Ruby 3.2.2, 3.3.0, and 3.3.1"
echo "- Essential development gems (bundler, rails, rspec, etc.)"
echo "- Code quality tools (rubocop, reek, brakeman, etc.)"
echo "- Enhanced IRB and Pry configurations"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Test Ruby: ruby -v"
echo "3. Test Bundler: bundle -v"
echo "4. Create a new Rails project: rails new myapp"
echo "5. Switch Ruby versions: mise use ruby@3.2.2"
echo ""
echo "Useful commands:"
echo "- mise list ruby          # List installed Ruby versions"
echo "- mise use ruby@3.3.1     # Switch to specific Ruby version"
echo "- mise global ruby@3.3.1  # Set global default Ruby version"
echo "- gem list                # List installed gems"
echo "- bundle install          # Install gems for a project"
