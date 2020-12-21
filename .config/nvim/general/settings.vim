syntax on

let mapleader = " "             " Change <leader> to space

set clipboard+=unnamedplus      " Use system clipboard
set tabstop=2 softtabstop=2     " 2 space
set shiftwidth=2                " 2 2 CHAINZ
set expandtab                   " Spaces > tabs
set smartindent                 " indent smartly
set number                      " Show current line number
set relativenumber              " Show relative line number
set showcmd                     " Show current command
set wildmode=longest:list,full  " Autocomplete
set showmatch                   " highlight matching braces
set hlsearch                    " Highlight search
set ignorecase                  " ignore case while searching
set nowrap                      " Don't wrap text
set smartcase                   " unless uppercase explicitly mentioned
set noswapfile                  " Dont create .swp or any other file after buffer
set laststatus=2                " Always show statusbar
set noshowmode                  " Hide mode (lightline shows mode)
set scrolloff=5                 " Minimum space on bottom/top of window
set nobackup                    " Backup file is immediately deleted
set incsearch                   " Increamental search
set termguicolors               " Terminal gui color
set foldmethod=syntax           " fold function in program

""" Undo settings
set undodir=~/.vim/undodir
set undofile

highlight ColorColumn ctermbg=0 guibg=lightgrey
" Uncomment below two line for Transparent Neovim
" hi Normal ctermbg=NONE guibg=NONE
" hi NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE



