# Dotfiles

## Install Chezmoi

```bash
pacman -S chezmoi
```

## Clone dotfiles and install them

```bash
chezmoi init --apply https://github.com/$GITHUB_USERNAME/dotfiles.git
```

https://www.chezmoi.io


## Install and Clone dotfiles

```bash
export GITHUB_USERNAME=capnbiggin
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
