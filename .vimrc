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
set showmode                    " Show current mode
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
set guifont="FiraCode\ Nerd\ Font\ Regular"

""" Undo settings
set undodir=~/.vim/undodir
set undofile


highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'              " Regex
Plug 'preservim/nerdtree'               " A tree explorer plugin for vim.
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'leafgarland/typescript-vim'       " Typescript syntax files for Vim
Plug 'vim-utils/vim-man'                " View and grep man pages in vim
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy find files
Plug 'sheerun/vim-polyglot'             " Mega language support pack
Plug 'mbbill/undotree'                  " The undo history visualizer for VIM
Plug 'evanleck/vim-svelte'              " Vim syntax highlighting and indentation for Svelte 3 components.
Plug 'haishanh/night-owl.vim'           " A 24bit dark Vim colorscheme based on sdras/night-owl-vscode-theme
Plug 'itchyny/lightline.vim'            " Awesome status bar
Plug 'drewtempelmeyer/palenight.vim'    " Soothing color scheme for your favorite [best] text editor
Plug 'mhinz/vim-startify'               " Lovely, informative start screen
Plug 'mattn/emmet-vim'                  " Expanding abbreviations
Plug 'ryanoasis/vim-devicons'           " File icons

call plug#end()

if !has('gui_running')
  set t_Co=256
endif

" Colorscheme
set background=dark
colorscheme palenight

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'palenight' }

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

if executable('rg')
    let g:rg_derive_root='true'
endif
" Ignore below extension while searching
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0
" NERDTree Settings
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enforcing Purity for myself to not use arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Use Ctrl+H,J,K,L to navigate panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

autocmd BufWritePre * call TrimWhitespace() " Remove trailing whitespace when saving
autocmd! BufReadPost * call SetCursorPosition()
" Trims trailing whitespace
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" Function to set cursor postion
function! SetCursorPosition()
  " dont do it when writing a commit log entry
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  else
    call cursor(1,1)
  endif
endfunction

