## Arch Linux with ml4w-arch setup
## Yet to figure out the order
## Currently, ml4w-arch is already installed. 
## Delete the content of the nvim folder in ml4w-arch
```zsh
rm ~/.mydotfiles/com.ml4w.dotfiles.stable/.config/nvim/init.vim

```

## Get the dotfiles from Github and install them

```zsh
git clone https://github.com/abhisek-roy/dotfiles.git
cd dotfiles/arch
stow -S .config -t ~/.mydotfiles/com.ml4w.dotfiles.stable/.config
```
