#!/usr/bin/env bash

# ===== GIT CONFIGURATION SCRIPT =====
# This script sets up Git with modern, developer-friendly settings
# Optimized for macOS and Ruby on Rails development workflow

echo "Configuring Git with modern settings..."

# ===== CORE GIT SETTINGS =====
# Branch and workflow configuration
git config --global init.defaultBranch main           # Use 'main' as default branch instead of 'master'
git config --global pull.rebase true                  # Use rebase strategy for pulls (not merge)
git config --global push.autoSetupRemote true         # Automatically set upstream when pushing new branches
git config --global fetch.prune true                  # Remove remote-tracking references that no longer exist

# ===== CORE BEHAVIOR =====
git config --global core.editor "cursor --wait"       # Use Cursor as the default Git editor
git config --global core.whitespace trailing-space,space-before-tab  # Detect whitespace errors

# ===== DIFF SETTINGS =====
git config --global diff.algorithm patience           # Use patience diff algorithm for better diffs
git config --global diff.colorMoved default           # Color moved lines in diffs
git config --global diff.renames copies               # Detect copied files in addition to renames

# ===== FETCH SETTINGS =====
git config --global fetch.parallel 0                  # Don't fetch in parallel (avoid rate limiting)
git config --global fetch.pruneTags true              # Remove tags that no longer exist on remote

# ===== GREP AND HELP =====
git config --global grep.lineNumber true              # Show line numbers in grep results
git config --global help.autocorrect 1                # Auto-correct typos in Git commands

# ===== TEMPLATES AND INITIALIZATION =====
git config --global init.templateDir ~/.git-templates  # Use custom Git templates directory

# ===== LOG SETTINGS =====
git config --global log.abbrevCommit true             # Abbreviate commit hashes
git config --global log.date iso                      # Use ISO format for dates
git config --global log.follow true                   # Follow renames in log

# ===== REBASE SETTINGS =====
git config --global rebase.stat true                  # Show statistics after rebase

# ===== REPACK SETTINGS =====
git config --global repack.usedeltabaseoffset true    # Use delta base offset for better compression

# ===== RERERE SETTINGS =====
git config --global rerere.enabled true               # Enable rerere (reuse recorded resolution)

# ===== STATUS SETTINGS =====
git config --global status.branch true                # Show branch info in status
git config --global status.short true                 # Use short status format
git config --global status.showUntrackedFiles all     # Show all untracked files

# ===== GIT ALIASES =====
git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'  # Pretty colored log
git config --global alias.routes 'bin/rails routes | fzf -e'  # Search Rails routes with fzf


# ===== GIT TEMPLATES AND HOOKS =====
# Create Git templates directory for consistent repository setup
mkdir -p ~/.git-templates/hooks

# Create a pre-commit hook template for basic code quality checks
cat > ~/.git-templates/hooks/pre-commit << 'EOF'
#!/bin/sh
# Pre-commit hook to run basic checks
# This hook will be copied to new repositories when using git init

# Check for trailing whitespace
if git rev-parse --verify HEAD >/dev/null 2>&1; then
    against=HEAD
else
    against=$(git hash-object -t tree /dev/null)
fi

# Redirect output to stderr.
exec 1>&2

# Check for trailing whitespace in staged files
if git diff-index --check --cached $against; then
    echo "Trailing whitespace found in staged files"
    exit 1
fi
EOF

# Make the pre-commit hook executable
chmod +x ~/.git-templates/hooks/pre-commit

# ===== COMPLETION MESSAGE =====
echo "Git configuration complete!"
echo "Your Git is now configured with:"
echo "- Modern default settings optimized for development"
echo "- Useful aliases (try 'git aliases' to see them all)"
echo "- Pre-commit hooks template for code quality"
echo ""
echo "Next steps:"
echo "1. Set your Git user info: git config --global user.name 'Your Name'"
echo "2. Set your Git email: git config --global user.email 'your.email@example.com'"
echo "3. Test an alias: git lg"
