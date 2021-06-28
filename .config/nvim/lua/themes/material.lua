vim.g.material_style = "palenight"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false

require('material').set()
-- Toggle the style live without the need to exit NeoVim
vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
