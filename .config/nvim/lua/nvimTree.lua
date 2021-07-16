local M = {}

M.config = function()
  local g = vim.g
  local icons = require "nvim-nonicons"
  local tree_cb = require "nvim-tree.config".nvim_tree_callback

  g.nvim_tree_side = "left"
  g.nvim_tree_width = 30
  g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
  g.nvim_tree_auto_open = 0
  g.nvim_tree_auto_close = 1
  g.nvim_tree_quit_on_open = 0
  g.nvim_tree_follow = 1
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_hide_dotfiles = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_root_folder_modifier = ":t"
  g.nvim_tree_tab_open = 0
  g.nvim_tree_auto_resize = 1

  g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 1
  }

  g.nvim_tree_icons = {
      default = icons.get("file"),
      symlink = "",
      -- git = {
      --     unstaged = "✗",
      --     staged = "✓",
      --     unmerged = "",
      --     renamed = "➜",
      --     untracked = "★",
      --     deleted = "",
      --     ignored = "◌"
      -- },
      folder = {
        default = icons.get("file-directory"),
        open = icons.get("file-directory-outline"),
        symlink = icons.get("file-directory"),
        symlink_open = icons.get("file-directory-outline"),
        empty = icons.get("file-directory-outline"),
        empty_open = icons.get("file-directory-outline"),
        arrow_open = icons.get("chevron-down"),
        arrow_closed = icons.get("chevron-right"),
      }
  }

  g.nvim_tree_bindings = {
    { key = "u",                            cb = tree_cb("dir_up") },
  }
end

return M
