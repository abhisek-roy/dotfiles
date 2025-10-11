# Restoring dotfiles

## Linux

#### Ubuntu

```bash
sudo apt install curl stow git neovim gcc make ripgrep fd unzip python3 cmake xclip ninja 
```

#### Arch

```bash
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim curl stow openssh python3 cmake xclip ninja fzf zoxide 
```

Follow instructions captured within the Arch folder.

#### Set up Git

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### Restore the Dotfiles

For Ubuntu:

```bash
git clone git@github.com:abhisek-roy/dotfiles.git
cd dotfiles/ubuntu
stow -S .
```

#### Install fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Say n to all follow-up confirmations.

#### Install zoxide

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

#### Install oh-my-posh

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

#### Get fonts

```bash
oh-my-posh font install JetBrainsMono
```

Set font MesloLGS Nerd Font Mono 12 and then restart the terminal.

#### Install zsh

For Ubuntu:

```bash
sudo apt install zsh
chsh -s $(which zsh)
```

For Arch:

```bash
sudo pacman -S --noconfirm --needed zsh
chsh -s /bin/zsh
```

## macOS

### Restore the Dotfiles

#### Install Stow

We need Homebrew to install Stow.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, run these. Your .zshrc will be updated -

```bash
echo >> /home/aroy/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/aroy/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

#### Set up Git

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

```bash
git clone git@github.com:abhisek-roy/dotfiles.git
cd dotfiles
stow -S .
```

####  Install fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

####  Install zoxide

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

####  Install oh-my-posh

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

#### Get fonts

```bash
oh-my-posh font install meslo
```

Set font MesloLGS Nerd Font Mono 12
