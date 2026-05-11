# Dotfiles

App-specific configs. Clone and symlink what you need.

**SSH setup:** [GitHub SSH key guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```bash
git clone git@github.com:abhisek-roy/dotfiles.git ~/dotfiles
```

---

## zsh

**Packages:** `zsh git curl fzf zoxide`

**oh-my-posh:** `oh-my-posh` (if not in repo, install via script below)

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

**Fonts:**

```bash
oh-my-posh font install JetBrainsMono
```

Set terminal font to `JetBrainsMono Nerd Font Mono`.

**Symlinks:**

```bash
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```

```bash
ln -s ~/dotfiles/zsh/ohmyposh ~/.config/ohmyposh
```

**Set default shell:**

```bash
chsh -s $(which zsh)
```

Zinit and plugins auto-install on first launch.

**Machine-specific config:** Create `~/.zshrc.local` for local overrides (conda, toolchains, etc.). It is sourced automatically and gitignored.

---

## tmux

**Packages:** `tmux git`

**Symlink:**

```bash
ln -s ~/dotfiles/tmux ~/.config/tmux
```

**Install TPM:**

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then inside tmux: `Ctrl+Space`, `Shift+I` to install plugins.

---

## nvim

**Packages:** `neovim gcc make git ripgrep fd unzip python3 cmake xclip ninja`

**Symlink:**

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Plugins auto-install on first launch.

---

## kanata

**Packages:** `kanata`

**Symlink:**

```bash
ln -s ~/dotfiles/kanata ~/.config/kanata
```

Only `kanata.kbd` is the active config. Other `.kbd` files are examples.
