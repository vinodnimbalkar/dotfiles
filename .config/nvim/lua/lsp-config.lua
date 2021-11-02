local nvim_lsp = require('lspconfig')

function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- LSP config (the mappings used in the default file don't quite work right)
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- default
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts) -- default
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- default
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- default
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- default

  buf_set_keymap("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts) -- LSP saga
  buf_set_keymap("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts) -- LSP saga
  buf_set_keymap("n", "K", "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts) -- LSP saga
  buf_set_keymap("n", "<space>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts) -- LSP saga
  buf_set_keymap("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts) -- LSP saga
  buf_set_keymap("v", "<leader>ca", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts) -- LSP saga

  -- scroll down hover doc or scroll in definition preview
  buf_set_keymap("n", "<C-j>", "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts) -- LSP saga
  buf_set_keymap("n", "<C-k>", "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts) -- LSP saga

  -- replace the default lsp diagnostic letters with prettier symbols
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
