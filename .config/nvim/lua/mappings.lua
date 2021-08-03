 local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Open neovim config
map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>", opt)

-- Enforcing Purity for myself to not use arrow keys
map("n", "<UP>", "<Nop>", opt)
map("n", "<Down>", "<Nop>", opt)
map("n", "<Left>", "<Nop>", opt)
map("n", "<Right>", "<Nop>", opt)

-- Mappings to move lines
map("n", "<A-j>", ":m .+1<CR>==", {noremap=true, silent=true})
map("n", "<A-k>", ":m .-2<CR>==", {noremap=true, silent=true})
map("i", "<A-j>", "<esc>:m .+1<CR>==", {noremap=true, silent=true})
map("i", "<A-k>", "<esc>:m .-2<CR>==", {noremap=true, silent=true})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {noremap=true, silent=true})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", {noremap=true, silent=true})

-- Use Ctrl+H,J,K,L to navigate panes
map("n", "<C-h>", "<C-w>h", {noremap=true, silent=true})
map("n", "<C-j>", "<C-w>j", {noremap=true, silent=true})
map("n", "<C-k>", "<C-w>k", {noremap=true, silent=true})
map("n", "<C-l>", "<C-w>l", {noremap=true, silent=true})

-- better indenting
map('v', '<', '<gv', {noremap = true, silent = true})
map('v', '>', '>gv', {noremap = true, silent = true})

-- Copy from cursor to End of line, type :h Y for more info
map("n", "Y", "y$", {noremap=true, silent=true})

-- Tabbing through buffers
map("n", "<C-Right>", ":bn<CR>")  -- Next buffer in list
map("n", "<C-Left>", ":bp<CR>")   -- Previous buffer in list
map("n", "<C-S-Left>", ":b#<CR>") -- Previous buffer you were in

-- Vim-Visual-Multi changing default to Ctrl+d like VSCode
vim.g.VM_maps = {}
vim.g.VM_maps['Find Under']         = '<C-d>'           -- replace C-n
vim.g.VM_maps['Find Subword Under'] = '<C-d>'           -- replace visual C-n

-- Remove ~ [Tidle]
-- let &fcs='eob: '

-- Mappings for nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap=true, silent=true})
