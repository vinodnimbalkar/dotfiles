function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
end

-- Mappings.
local opts = {noremap = true, silent = true}

-- LSP config (the mappings used in the default file don't quite work right)
buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

-- Auto-format
vim.cmd([[
  augroup fmt
    autocmd!
      au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
    augroup END
  ]])
