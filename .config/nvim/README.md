# NeoVim Configuration

> If you are waiting for neovim stable version of 0.5, then it's better to wait because it'll breaking :boom: changes when i configure it.

## Features

- Lovely, informative start screen
- File Navigation with Nerdtree
- Managing tabs with buffer
- Full LSP support with coc.nvim
- Blazingly fast file search with FZF
- VimPlug -Minimalist Vim Plugin Manager
- Smooth scrolling
- Language snippet support by coc.nvim
- Lazygit inside neovim :ok_hand:
- Distraction-free writing in Vim - GOYO
- Git diff markers
- Theme switcher `:Colors`

## Installation

1. Install Neovim latest stable version
2. Clone this repository `git clone https://github.com/vinodnimbalkar/dotfiles`
3. `cd dotfiles/.config/nvim`
4. The install.sh script will delete old neovim config so backup!!
5. Run the install.sh file (this might only work on unix based system), this open neovim (press enter or y to skip errors, the errrs will only show once.)

## Stucture

```bash
├── autoload
├── coc-settings.json
├── general
├── init.vim
├── install.sh
├── keys
├── plug-config
├── README.md
├── rplugin
├── themes
└── vim-plug

7 directories, 4 files
```

- The init.vim heart of neovim configuartion.
- install.sh to install neovim configuartion.
- autoload directory vim plug stuff
- general directory for general settings and functions
- keys directory for neovim keybindings and which key plugin configuartion
- themes directory for themes
- plug-config directory for coc and floaterm config
