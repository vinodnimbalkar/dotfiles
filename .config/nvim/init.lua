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
require("neoscroll").setup() -- smooth scroll

-- LSP stuff
require "lsp-config"
require "compe-config"
require("lspkind").init()
require "lspsaga".init_lsp_saga()
require "lsp-install"

-- ColorsScheme
require "themes/material"
require "symbol-outline"

--Color
require "colorizer".setup()

-- Things
require "treesitter-nvim"
require "telescope-nvim"
require "nvimTree" -- file tree stuff
-- require "presence-nvim" --discord presence

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("nvim_comment").setup()

-- Utils
require "dashboard"
require "whichkey"

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0
]],
    false
)
