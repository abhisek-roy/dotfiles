# Restore dotfiles

## Setup the OS
### Linux
Install curl, git, neovim and stow
```bash
sudo apt install curl stow git neovim
```
Set up Git

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

#### Restore dotfiles
```bash
git clone git@github.com:abhisek-roy/dotfiles.git
cd dotfiles
stow -S .
```

Install zsh
```bash
chsh -s $(which zsh)
```

Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Make sure this lines stays at the top
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### macOS
Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

## Install oh-my-posh
### macOS
brew install jandedobbeleer/oh-my-posh/oh-my-posh

### Linux
curl -s https://ohmyposh.dev/install.sh | bash -s

### Get fonts
oh-my-posh font install meslo

Set font MesloLGS Nerd Font Mono 12

## Download the Dotfiles

## Install Stow
sudo apt-get install stow
