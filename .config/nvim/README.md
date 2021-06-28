# NeoVim Configuration

> If you are want neovim stable version of 0.4.4, then it's better to see this [commit](https://github.com/vinodnimbalkar/dotfiles/tree/06b03155e0063b0104949512a6888aefca4f2d25/.config/nvim).

## Features

- Lovely, informative start screen
- File Navigation with Nvim-Tree.
- Managing tabs with buffer
- Full native LSP support.
- Blazingly fast file search with Telescope 😎
- Packer - Minimalist Vim Plugin Manager
- Smooth scrolling
- Lazygit inside neovim :ok_hand:
- Distraction-free writing in Vim - GOYO
- Git diff markers
- Theme switcher `<leader>mm`

## Installation

1. Install Neovim latest stable version
2. Clone this repository `git clone https://github.com/vinodnimbalkar/dotfiles`
3. `cd dotfiles/.config/nvim`
4. The install.sh script will delete old neovim config so backup!!
5. Run the install.sh file (this might only work on unix based system), this open neovim (press enter or y to skip errors, the errrs will only show once.)

## Stucture

```bash
.
├── init.lua
├── install.sh
└── lua
    ├── blankline.lua
    ├── compe-config.lua
    ├── dashboard.lua
    ├── floaterm.lua
    ├── gitsigns-nvim.lua
    ├── lsp
    │   ├── python-lsp.lua
    │   └── typescript-lsp.lua
    ├── lsp-config.lua
    ├── mappings.lua
    ├── nvimTree.lua
    ├── plugins.lua
    ├── settings.lua
    ├── statusline.lua
    ├── telescope-nvim.lua
    ├── themes
    │   ├── material.lua
    │   └── tokyonight.lua
    ├── top-bufferline.lua
    ├── treesitter-nvim.lua
    └── whichkey.lua

3 directories, 21 files
```

- The init.lua heart of neovim configuartion.
- install.sh to install neovim configuartion.
- themes directory for themes
