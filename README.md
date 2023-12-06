## Setup for Apple Silicon

Duplicate the terminal app, and rename a copy as Terminal Rosetta.
Press CMD + I on the Terminal Rosetta app, then check the box "Open using Rosetta".

## Xcode

```bash
xcode-select --install
```

## Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## SSS key

```bash
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
```

collet public key and add it to [github.com/settings/ssh](https://github.com/settings/ssh)

```bash
cat ~/.ssh/id_ed25519.pub
```

## Dotfiles

```bash
cd ~
git clone git@github.com:ThomPouillevet/dotfiles.git
cd dotfiles
find ~/dotfiles -name '*.sh' | xargs -I file chmod u+x file
```

### Brew

need to be connected to the apple store for mas installation

```bash
sh brew/brew.sh
```

### Git

```bash
sh git/git.sh
```

### ZSH

```bash
sh zsh/zsh.sh
```

### Ruby

```bash
sh ruby/rbenv.sh
```
### SSH

```bash
cp ssh/config ~/.ssh/config
```

### Enable interactive rebase in VS code
- Install GitLens VS Code extension
- In the Settings, enable `git allow force push` and GitLens : Interactive Rebase Editor
- set VS Code as your git editor: `git config --global core.editor "code --wait"`
