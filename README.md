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

## To setup the debugger on VSCode:
- add alias
```
alias ovdebug='overmind start -f Procfile.dev -l sidekiq_worker,sidekiq_worker_test_scenarios,mailcatcher,webpack'
```
- Use this VSCode extension: ruby_LSP https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-extensions-pack
- in vscode in launch.json file, I have this config
```
{
  "type": "ruby_lsp",
  "name": "Debug",
  "request": "launch",
  "program": "bundle exec puma -C ./config/puma.rb -b 'tcp://127.0.0.1:3000' -b 'ssl://127.0.0.1:3001'"
}
```

### Add Git lg alias (could be integrated in ~/.zshrc)
```
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```
### To setup the gems table_print and awesome_print without having to add them in your gemfile
Create a ~/.pryrc file and in it:
```
$LOAD_PATH << "my_gem_path that I get with gem which awesome_print (you need to stop at the lib folder: foo/bar/lib/)"; nil

begin
  require 'awesome_print'
  AwesomePrint.defaults = {
    indent: -2, # left aligned
    index: false
    # more customization
  }
  # Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "ℹ️ no awesome_print :("
end

$LOAD_PATH << "my_gem_path that I get with gem which table_print (you need to stop at the lib folder: foo/bar/lib/)"; nil

begin
  require 'table_print'
rescue LoadError => err
  puts "ℹ️ no table_print :("
end

```
