local M = {}

M.config = function()
  local g = vim.g
  local tree_cb = require "nvim-tree.config".nvim_tree_callback
  local nvimtree = require"nvim-tree"

  g.nvim_tree_bindings = {
    { key = "u",                            cb = tree_cb("dir_up") },
  }

  g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
  g.nvim_tree_quit_on_open = 0
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_hide_dotfiles = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_root_folder_modifier = ":t"

  g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1
  }

  g.nvim_tree_icons = {
     default = "",
     symlink = "",
     git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
      },
      folder = {
        default = " ",
        open = " ",
        symlink = " ",
        symlink_open = " ",
        empty = " ",
        empty_open = " ",
        arrow_open = " ",
        arrow_closed = " ",
      }
  }

end

 nvimtree.setup {
  diagnostics = {
      enable = false,
      icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
      },
   },
   filters = {
      dotfiles = false,
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close = false,
   open_on_tab = false,
   hijack_cursor = true,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      allow_resize = true,
      side = "left",
      width = 25,
   },
}

return M
