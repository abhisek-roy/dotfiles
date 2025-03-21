# Restore dotfiles

## Setup the OS
### Linux
Would Homebrew work here? Need to test.
chsh -s $(which zsh)

### macOS
Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Download the Dotfiles

## Install Stow
sudo apt-get install stow

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
