# Restore dotfiles

## Setup the OS
### Linux
Install zsh 
chsh -s $(which zsh)

Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Make sure this lines stays at the top
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
