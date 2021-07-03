local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        use "wbthomason/packer.nvim"            -- Package Manager

        -- color related stuff
        use "kyazdani42/nvim-palenight.lua"     -- A palenight colorscheme for neovim
        use "folke/tokyonight.nvim"
        use "marko-cerovac/material.nvim"       -- Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins
        use "simrat39/symbols-outline.nvim"     -- A tree like view for symbols in Neovim using the Language Server Protocol.
        use "norcalli/nvim-colorizer.lua"       -- The fastest Neovim colorizer.

        -- lang stuff
        use "nvim-treesitter/nvim-treesitter"   -- Nvim Treesitter configurations and abstraction layer
        use "neovim/nvim-lspconfig"             -- Quickstart configurations for the Nvim LSP client
        use "hrsh7th/nvim-compe"                -- Auto completion plugin for nvim that written in Lua.
        use "onsails/lspkind-nvim"              -- vscode-like pictograms for neovim lsp completion items
        use "sbdchd/neoformat"                  -- A (Neo)vim plugin for formatting code.
        use "kabouzeid/nvim-lspinstall"         -- Provides the missing :LspInstall for nvim-lspconfig
        use "glepnir/lspsaga.nvim"              -- Neovim lsp plugin

        use "lewis6991/gitsigns.nvim"           -- Super fast git decorations implemented purely in lua/teal.
        use "akinsho/nvim-bufferline.lua"       -- A snazzy bufferline for Neovim
        use "glepnir/galaxyline.nvim"
        use "windwp/nvim-autopairs"             -- autopairs for neovim written by lua
        use "alvan/vim-closetag"                -- Auto close (X)HTML tags
        use {"iamcco/markdown-preview.nvim",
              run="cd app & npm install"}       -- markdown preview plugin for (neo)vim

        -- Comment
        use "terrortylor/nvim-comment"          -- A comment toggler for Neovim, written in Lua

        -- snippet support
        use "hrsh7th/vim-vsnip"                 -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        use "rafamadriz/friendly-snippets"      -- Set of preconfigured snippets for different languages.

        -- file managing , picker etc
        use "kyazdani42/nvim-tree.lua"          -- A file explorer tree for neovim written in lua
        use "yamatsum/nvim-nonicons"            -- Icon set using nonicons for neovim plugins and settings
        use "kyazdani42/nvim-web-devicons"      -- lua `fork` of vim-web-devicons for neovim
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"               -- An implementation of the Popup API from vim in Neovim
        use "nvim-telescope/telescope.nvim"     -- Find, Filter, Preview, Pick. All lua, all the time.
        use "nvim-telescope/telescope-media-files.nvim" -- Telescope extension to preview media files using Ueberzug.

        -- misc
        use "glepnir/dashboard-nvim"
        use "tweekmonster/startuptime.vim"
        use "907th/vim-auto-save"               -- Automatically save changes to disk in Vim
        use "karb94/neoscroll.nvim"             -- `Smooth scrolling neovim plugin written in lua`
        use "junegunn/goyo.vim"                 -- Distraction-free writing in Vim
        use "folke/which-key.nvim"              -- Vim plugin that shows keybindings in popup
        use "voldikss/vim-floaterm"             -- Terminal manager for (neo)vim
        use "tpope/vim-surround"                -- surround.vim: quoting/parenthesizing made simple
        use "kosayoda/nvim-lightbulb"           -- VSCode bulb for neovim's built-in LSP.
        use "andweeb/presence.nvim"             -- Discord Rich Presence for Neovim
        use "lukas-reineke/indent-blankline.nvim" --Indent guides for Neovim
    end
)
