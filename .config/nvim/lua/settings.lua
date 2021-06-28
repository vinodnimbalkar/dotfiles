-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

g.mapleader = " "
g.auto_save = 0

cmd "syntax on"

opt("o", "clipboard","unnamedplus")            -- Use system clipboard
opt("o", "softtabstop", 2)                     -- 2 space
opt("o", "tabstop", 2)                         -- 2 space
opt("b", "shiftwidth", 2)                      -- 2 2 CHAINZ
opt("b", "expandtab", true)                    -- Spaces > tabs
opt("b", "smartindent", true)                  -- indent smartly
opt("o", "number", true)                       -- Show current line number
opt("o", "relativenumber", true)               -- Show relative line number
opt("o", "showcmd", true)                      -- Show current command
opt("o", "wildmode", "longest:list,full")      -- Autocomplete
opt("o", "showmatch", true)                    -- highlight matching braces
opt("o", "hlsearch", true)                     -- Highlight search
opt("o", "ignorecase", true)                   -- ignore case while searching
opt("o", "wrap", false)                        -- Don't wrap text
opt("o", "smartcase", true)                    -- unless uppercase explicitly mentioned
opt("o", "swapfile", false)                    -- Dont create .swp or any other file after buffer
opt("o", "laststatus", 2)                      -- Always show statusbar
opt("o", "showmode", false)                    -- Hide mode (lightline shows mode)
opt("o", "scrolloff", 5)                       -- Minimum space on bottom/top of window
opt("o", "backup", false)                      -- Backup file is immediately deleted
opt("o", "incsearch", true)                    -- Increamental search
opt("o", "inccommand", "nosplit")              -- Live substitution
opt("o", "termguicolors", true)                -- Terminal gui color
opt("o", "foldmethod", "syntax")               -- fold function in program
opt("o", "timeoutlen", 500)                    -- Which key timeoutlen
opt("w", "colorcolumn", "9999")                -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
opt("w", "signcolumn", "yes")                  -- Always show the signcolumn, otherwise it would shift the text each time
opt("b", "undofile", true)                     -- Undo Settings
opt("w", "foldmethod", "syntax")               -- enable foldmethod on syntax
opt("o", "background", "dark")                 -- Dark background

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end
-- file extension specific tabbing
cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])
-- TrimWhite Space
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- triggered when a buffer is read (BufRead), matching all files (*) and executes the zR (opens all folds) command in normal mode.
cmd([[autocmd BufRead * normal zR]])

-- lightbulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
return M

