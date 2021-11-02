-- General settings
require "settings"
require "mappings"

-- load all plugins
require "plugins"

-- UI
require "floaterm"
require "top-bufferline"
require "statusline"
require "blankline"

-- LSP stuff
require "lsp-config"
require "cmp-config"
require("lspkind").init()
require "lspsaga".init_lsp_saga()
require "lsp-install"
require "nvim-dap"

-- ColorsScheme
require "themes/material"
require "symbol-outline"

--Color
require "colorizer".setup()

-- Things
require "telescope-nvim"

-- git signs , lsp symbols etc
require("nvim-autopairs").setup()
require("nvim_comment").setup()

