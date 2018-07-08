## Clone these dotfiles into a new computer

clone your github repository

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
