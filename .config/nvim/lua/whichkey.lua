local wk = require("which-key")

-- t is for the terminal
wk.register({
  ["<leader>t"] = { name = "+terminal" },
  ["<leader>tf"] = { ":FloatermNew fzf<CR>", "fzf" },
  ["<leader>tg"] = { ":FloatermNew lazygit<CR>", "git" },
  ["<leader>tn"] = { ":FloatermNew node<CR>", "node" },
  ["<leader>tp"] = { ":FloatermNew ipython3<CR>", "python" },
  ["<leader>tr"] = { ":FloatermNew ranger<CR>", "ranger" },
  ["<leader>th"] = { ":FloatermNew htop<CR>", "htop" },
})

-- f is for the files
wk.register({
  ["<leader>f"] = {name = "+files"},
  ["<leader>ff"] = { ":lua require('telescope.builtin').find_files()<CR>", "Telescope Find Files"},
  ["<leader>fo"] = { ":lua require('telescope.builtin').oldfiles()<CR>", "Telescope Recents"},
  ["<leader>fw"] = { ":Telescope live_grep<CR>", "Telescope Find Word"},
  ["<leader>fn"] = { ":DashboardNewFile<CR>]", "New File"},
  ["<leader>fp"] = { ":lua require('telescope').extensions.media_files.media_files()<CR>]", "Telescope Media file"},
  ["<leader>fh"] = { ":lua require('telescope.builtin').help_tags()<CR>]", "Help Tags"},
  ["<leader>fb"] = { ":lua require('telescope.builtin').buffers()<CR>]", "Telescope buffers"},
})

-- Single Mapping
wk.register({
  ["<leader>z"] = {":Goyo<CR>", "Zen"},
  ["<leader>v"] = {"<C-W>v", "Split Right"}
})
