-- Set the theme style
vim.g.material_style = "palenight"

-- Enable italic comments
vim.g.material_italic_comments = true

-- Enable italic keywords
vim.g.material_italic_keywords = true

-- Enable italic function names
vim.g.material_italic_functions = true

-- Enable italic variable names
vim.g.material_italic_variables = false

-- Enable high contrast
vim.g.material_contrast = true

-- Enable borders
vim.g.material_borders = false

-- Enable terminal background
vim.g.material_disable_background = false

-- Toggle the style live
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })

-- Enable the colorscheme
require('material').set()

