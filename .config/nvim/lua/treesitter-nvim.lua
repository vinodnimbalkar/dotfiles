local M = {}

M.config = function()
  local ts_config = require("nvim-treesitter.configs")

  ts_config.setup {
      ensure_installed = {
          "javascript",
          "html",
          "css",
          "bash",
          "lua",
          "json",
          "python",
          "tsx"
      },
      highlight = {
          enable = true,
          use_languagetree = true
      },
      indent = {
        enable = true
      }
  }
end

return M
