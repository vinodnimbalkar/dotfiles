vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
    function()
        use "wbthomason/packer.nvim"            -- Package Manager

        -- color related stuff
        use "folke/tokyonight.nvim"
        use "marko-cerovac/material.nvim"       -- Material colorscheme for NeoVim written in Lua with built-in support for native LSP, TreeSitter and many more plugins
        use "simrat39/symbols-outline.nvim"     -- A tree like view for symbols in Neovim using the Language Server Protocol.
        use "norcalli/nvim-colorizer.lua"       -- The fastest Neovim colorizer.

        -- lang stuff
        use{
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require("treesitter-nvim").config()
            end
        }                                       -- Nvim Treesitter configurations and abstraction layer
        use "neovim/nvim-lspconfig"             -- Quickstart configurations for the Nvim LSP client
        use "williamboman/nvim-lsp-installer"   -- Seamlessly install LSP servers locally with :LspInstall.
        use 'hrsh7th/cmp-nvim-lsp'              -- A completion plugin for neovim coded in Lua.
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        use "onsails/lspkind-nvim"              -- vscode-like pictograms for neovim lsp completion items
        use "sbdchd/neoformat"                  -- A (Neo)vim plugin for formatting code.
        -- use "glepnir/lspsaga.nvim"              -- Neovim lsp plugin
        use "tami5/lspsaga.nvim"                -- when issue solved, uncomment above OG plugin, using temporary
        use 'mfussenegger/nvim-dap'             -- Debug Adapter Protocol client implementation for Neovim (>= 0.5)
        use {
          "lewis6991/gitsigns.nvim",
          event = "BufRead",
          config = function()
            require("gitsigns").setup()
          end
        }                                       -- Super fast git decorations implemented purely in lua/teal.
        use "akinsho/nvim-bufferline.lua"       -- A snazzy bufferline for Neovim
        use {
          'hoob3rt/lualine.nvim',
          requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }                                       -- statusline plugin written in pure lua & icons
        use "windwp/nvim-autopairs"             -- autopairs for neovim written by lua
        use "alvan/vim-closetag"                -- Auto close (X)HTML tags
        use {"iamcco/markdown-preview.nvim",
              run="cd app & npm install"}       -- markdown preview plugin for (neo)vim

        -- Comment
        use "terrortylor/nvim-comment"          -- A comment toggler for Neovim, written in Lua

        -- snippet support
        use "L3MON4D3/LuaSnip"                  -- Snippet Engine for Neovim written in Lua.
        use "hrsh7th/vim-vsnip"                 -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
        use "rafamadriz/friendly-snippets"      -- Set of preconfigured snippets for different languages.

        -- file managing , picker etc
        use{
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
              require"nvim-tree".setup{}
            end
        }                                       -- A file explorer tree for neovim written in lua
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"               -- An implementation of the Popup API from vim in Neovim
        use "nvim-telescope/telescope.nvim"     -- Find, Filter, Preview, Pick. All lua, all the time.
        use "nvim-telescope/telescope-media-files.nvim" -- Telescope extension to preview media files using Ueberzug.

        -- misc
        use "tweekmonster/startuptime.vim"
        use "907th/vim-auto-save"               -- Automatically save changes to disk in Vim
        use {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("neoscroll").setup()
            end
        }                                       -- `Smooth scrolling neovim plugin written in lua`
        use "junegunn/goyo.vim"                 -- Distraction-free writing in Vim
        use {
            "folke/which-key.nvim",
            config = function()
              require("whichkey").config()
            end
        }                                       -- Vim plugin that shows keybindings in popup
        use "voldikss/vim-floaterm"             -- Terminal manager for (neo)vim
        use "tpope/vim-surround"                -- surround.vim: quoting/parenthesizing made simple
        use "tpope/vim-repeat"                  -- repeat.vim: enable repeating supported plugin maps with "."
        use "lukas-reineke/indent-blankline.nvim" --Indent guides for Neovim
        use "chrisbra/csv.vim"                  -- A Filetype plugin for csv files
    end
)
