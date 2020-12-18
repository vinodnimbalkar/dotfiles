```
                              .___      __    _____.__.__
                            __| _/_____/  |__/ ____\__|  |   ____   ______
                           / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/
                          / /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \
                          \____ |\____/|__|  |__|  |__|____/\___  >____  >
                               \/                               \/     \/

                    This repository contains personal dotfiles of Vinod Nimbalkar.
```
# dotfiles

## Used Applications
- **Distro:** Ubuntu 20.04 LTS
- **Window Manager:** Qtile 
- **Shell:** zsh (+oh\_my\_zsh)
- **Terminal:** Alacritty
- **Text Editor:** Neovim/Vim | VS Code
- **Menus:** Dmenu
- **File Manager:** Vifm
- **Audio Player:** cmus
- **System Monitoring Dashboard:** htop
- **compositor:** Compton

## Wallpaper
I got them from a collection of [Derek Taylor](https://gitlab.com/dwt1/wallpapers),

## Clone these dotfiles into a new computer

I manage my dotfiles with a bare git repository and would encourage you to do the same. [How to?](https://www.atlassian.com/git/tutorials/dotfiles)
clone this github repository

```
git clone --bare https://github.com/vinodnimbalkar/dotfiles.git $HOME/.dotfiles
```

define the alias in the current shell scope

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

checkout the actual content from the git repository to your $HOME

```
dotfiles checkout
```

Awesome! You’re done.
