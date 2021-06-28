-- load all plugins
require "plugins"
require "settings"
require "floaterm"

require "top-bufferline"
require "statusline"
require "blankline"

require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "lsp-config"
require "compe-config"
require "lsp/python-lsp"

--theme
require "themes/material"

require "treesitter-nvim"
require "mappings"

require "telescope-nvim"
require "nvimTree" -- file tree stuff

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("nvim-autopairs").setup()
require("lspkind").init()

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0
]],
    false
)

require "whichkey"
require "dashboard"
require("nvim_comment").setup()
