#!/usr/bin/env bash

# ===== GIT CONFIGURATION SCRIPT =====
# This script sets up Git with modern, developer-friendly settings
# Optimized for macOS and Ruby on Rails development workflow

echo "Configuring Git with modern settings..."

# ===== CORE GIT SETTINGS =====
# Branch and workflow configuration
git config --global init.defaultBranch main          # Use 'main' as default branch instead of 'master'
git config --global pull.rebase false                 # Use merge strategy for pulls (not rebase)
git config --global push.autoSetupRemote true         # Automatically set upstream when pushing new branches
git config --global fetch.prune true                  # Remove remote-tracking references that no longer exist

# ===== CORE BEHAVIOR =====
git config --global core.autocrlf input               # Convert CRLF to LF on commit, but not on checkout (macOS/Linux)
git config --global core.editor "cursor --wait"       # Use Cursor as the default Git editor
git config --global core.excludesfile ~/.gitignore_global  # Use global .gitignore file
git config --global core.ignorecase false             # Don't ignore case in filenames (important for cross-platform)
git config --global core.precomposeunicode true       # Handle Unicode filenames properly on macOS
git config --global core.quotepath false              # Don't quote non-ASCII characters in output
git config --global core.safecrlf warn                # Warn about CRLF/LF conversion issues
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

# ===== MERGE SETTINGS =====
git config --global merge.conflictstyle diff3         # Show common ancestor in merge conflicts
git config --global merge.ff false                    # Don't fast-forward merges (create merge commits)
git config --global merge.log true                    # Include merged commits in merge commit message
git config --global merge.renameLimit 999999          # High rename limit for complex merges
git config --global merge.stat true                   # Show merge statistics

# ===== PULL SETTINGS =====
git config --global pull.ff only                      # Only allow fast-forward pulls
git config --global pull.rebase false                 # Use merge strategy for pulls

# ===== PUSH SETTINGS =====
git config --global push.default simple               # Push current branch to upstream branch
git config --global push.followTags true              # Push tags when pushing commits

# ===== REBASE SETTINGS =====
git config --global rebase.autoStash true             # Automatically stash before rebasing
git config --global rebase.stat true                  # Show statistics after rebase

# ===== RECEIVE SETTINGS =====
git config --global receive.autogc true               # Run garbage collection after receiving
git config --global receive.fsckObjects true          # Check object integrity on receive

# ===== REMOTE SETTINGS =====
git config --global remote.origin.prune true          # Prune remote-tracking branches

# ===== REPACK SETTINGS =====
git config --global repack.usedeltabaseoffset true    # Use delta base offset for better compression

# ===== RERERE SETTINGS =====
git config --global rerere.enabled true               # Enable rerere (reuse recorded resolution)

# ===== STATUS SETTINGS =====
git config --global status.branch true                # Show branch info in status
git config --global status.short true                 # Use short status format
git config --global status.showUntrackedFiles all     # Show all untracked files

# ===== SUBMODULE SETTINGS =====
git config --global submodule.recurse true            # Recurse into submodules by default

# ===== TRANSFER SETTINGS =====
git config --global transfer.fsckObjects true         # Check object integrity on transfer

# ===== URL SETTINGS =====
git config --global url."https://".insteadOf git://   # Use HTTPS instead of git:// protocol

# ===== GIT ALIASES =====
# These aliases provide shortcuts for common Git operations

# Basic workflow aliases
git config --global alias.add-commit '!git add -A && git commit'  # Add all and commit in one command
git config --global alias.aliases '!git config --get-regexp alias'  # List all aliases
git config --global alias.amend '!git commit --amend --reuse-message=HEAD'  # Amend last commit
git config --global alias.branch-name '!git rev-parse --abbrev-ref HEAD'  # Show current branch name
git config --global alias.branches 'branch -a'        # List all branches
git config --global alias.ci 'commit'                 # Short for commit
git config --global alias.co 'checkout'               # Short for checkout
git config --global alias.cob 'checkout -b'           # Create and checkout new branch
git config --global alias.commits 'log --oneline'     # Show commits in one line
git config --global alias.dc 'diff --cached'          # Show staged changes
git config --global alias.delete-merged-branches '!git branch --merged | grep -v "\\*" | xargs -n 1 git branch -d'  # Delete merged branches
git config --global alias.di 'diff'                   # Short for diff
git config --global alias.discard 'checkout --'       # Discard changes in working directory
git config --global alias.discard-all 'reset --hard HEAD'  # Discard all changes
git config --global alias.fixup '!git commit --fixup=$(git rev-parse HEAD)'  # Create fixup commit
git config --global alias.graph 'log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'  # Pretty graph log
git config --global alias.last 'log -1 HEAD'          # Show last commit
git config --global alias.ll 'log --oneline'          # Short log
git config --global alias.merged 'branch --merged'    # Show merged branches
git config --global alias.no-merged 'branch --no-merged'  # Show unmerged branches
git config --global alias.pom 'push origin main'      # Push to origin main
git config --global alias.pu 'push'                   # Short for push
git config --global alias.pull-all '!git pull && git submodule update --init --recursive'  # Pull and update submodules
git config --global alias.recent 'for-each-ref --sort=-committerdate refs/heads/ --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"'  # Show recent branches
git config --global alias.remotes 'remote -v'         # Show remotes
git config --global alias.ri 'rebase -i'              # Interactive rebase
git config --global alias.rv 'remote -v'              # Show remotes
git config --global alias.s 'status'                  # Short for status
git config --global alias.sb 'status -sb'             # Short status with branch info
git config --global alias.shove 'push --force-with-lease'  # Safe force push
git config --global alias.squash '!git reset --soft $(git rev-list --max-parents=0 HEAD) && git commit'  # Squash all commits
git config --global alias.st 'status'                 # Short for status
git config --global alias.stage 'add'                 # Stage files
git config --global alias.staged 'diff --cached'      # Show staged changes
git config --global alias.stashes 'stash list'        # List stashes
git config --global alias.undo 'reset --soft HEAD^'   # Undo last commit (keep changes)
git config --global alias.unstage 'reset HEAD --'     # Unstage files
git config --global alias.visual '!gitk'              # Open Git GUI
git config --global alias.whoami '!git config user.name && git config user.email'  # Show user info

# Personal Git aliases from your current setup
git config --global alias.lg 'log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'  # Pretty colored log
git config --global alias.routes 'bin/rails routes | fzf -e'  # Search Rails routes with fzf

# ===== GLOBAL .GITIGNORE =====
# Create a comprehensive global .gitignore file for common development files
cat > ~/.gitignore_global << 'EOF'
# macOS system files
.DS_Store
.AppleDouble
.LSOverride
Icon
._*
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

# Windows system files
Thumbs.db
ehthumbs.db
Desktop.ini
$RECYCLE.BIN/
*.cab
*.msi
*.msm
*.msp
*.lnk

# Linux system files
*~
.fuse_hidden*
.directory
.Trash-*
.nfs*

# Node.js dependencies and build artifacts
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.npm
.yarn-integrity

# Ruby gems and build artifacts
*.gem
*.rbc
/.config
/coverage/
/InstalledFiles
/pkg/
/spec/reports/
/spec/examples.txt
/test/tmp/
/test/version_tmp/
/tmp/
*.swp
*.swo
*~

# Rails specific files
*.rbc
capybara-*.html
.rspec
/db/*.sqlite3
/db/*.sqlite3-journal
/db/*.sqlite3-[0-9]*
/public/system
/coverage/
/spec/tmp
*.orig
rerun.txt
pickle-email-*.html

# Rails log and temporary files
/log/*
/tmp/*
!/log/.keep
!/tmp/.keep

# Rails process files
/tmp/pids/*
!/tmp/pids/
!/tmp/pids/.keep

# Rails storage and assets
/storage/*
!/storage/.keep
/public/assets
.byebug_history

# Rails credentials
/config/master.key

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE and editor files
.vscode/
.idea/
*.swp
*.swo
*~

# Log files
logs
*.log

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Test coverage
coverage/
.nyc_output

# Package managers
node_modules/
jspm_packages/
.npm
.node_repl_history
*.tgz
.yarn-integrity

# Build tools
.cache
.parcel-cache
.next
.nuxt
.vuepress/dist
.serverless
.fusebox/
.dynamodb/
.tern-port
.vscode-test

# Temporary folders
tmp/
temp/
EOF

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

# Make shell scripts executable if they have shebang
for file in $(git diff-index --cached --name-only $against); do
    if [ -f "$file" ]; then
        if head -1 "$file" | grep -q "^#!"; then
            if [ ! -x "$file" ]; then
                echo "Making $file executable"
                chmod +x "$file"
                git add "$file"
            fi
        fi
    fi
done
EOF

# Make the pre-commit hook executable
chmod +x ~/.git-templates/hooks/pre-commit

# ===== COMPLETION MESSAGE =====
echo "Git configuration complete!"
echo "Your Git is now configured with:"
echo "- Modern default settings optimized for development"
echo "- Useful aliases (try 'git aliases' to see them all)"
echo "- Global .gitignore file for common development files"
echo "- Pre-commit hooks template for code quality"
echo ""
echo "Next steps:"
echo "1. Set your Git user info: git config --global user.name 'Your Name'"
echo "2. Set your Git email: git config --global user.email 'your.email@example.com'"
echo "3. Test an alias: git lg"
