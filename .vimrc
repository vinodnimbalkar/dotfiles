syntax on

let mapleader = " "             " Change <leader> to space

set nocompatible                " https://superuser.com/questions/543317/what-is-compatible-mode-in-vim/543327
set clipboard+=unnamedplus      " Use system clipboard
set tabstop=2 softtabstop=2     " Insert 2 spaces for a tab
set shiftwidth=2                " Change the number of space characters inserted for indentation
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

call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'                          " Regex
Plug 'preservim/nerdtree'                           " A tree explorer plugin for vim.
Plug 'tpope/vim-surround'                           " surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'tpope/vim-commentary'                         " Comment stuff out
Plug 'leafgarland/typescript-vim'                   " Typescript syntax files for Vim
Plug 'sheerun/vim-polyglot'                         " Mega language support pack
Plug 'mbbill/undotree'                              " The undo history visualizer for VIM
Plug 'evanleck/vim-svelte'                          " Vim syntax highlighting and indentation for Svelte 3 components.
Plug 'itchyny/lightline.vim'                        " Awesome status bar
Plug 'drewtempelmeyer/palenight.vim'                " Soothing color scheme for your favorite [best] text editor
Plug 'mhinz/vim-startify'                           " Lovely, informative start screen
Plug 'mattn/emmet-vim'                              " Expanding abbreviations
Plug 'ryanoasis/vim-devicons'                       " File icons
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Intellisense engine for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf love vim
Plug 'junegunn/fzf.vim'                             " Fuzzy search for vim
Plug 'voldikss/vim-floaterm'                        " Use nvim/vim's builtin terminal in the floating/popup window
Plug 'liuchengxu/vim-which-key'                     " Vim plugin that shows keybindings in popup
Plug 'junegunn/goyo.vim'                            " Distraction-free writing in Vim
Plug 'airblade/vim-gitgutter'                       " A Vim plugin which shows git diff markers in the sign column
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors plugin for vim/neovim
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && npm install'} "markdown preview plugin for (neo)vim
Plug 'kaicataldo/material.vim', { 'branch': 'main' } "A port of the Material color scheme for Vim/Neovim

call plug#end()

if !has('gui_running')
  set t_Co=256
endif

" Colorscheme
set background=dark
colorscheme palenight

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'palenight' }

if executable('rg')
    let g:rg_derive_root='true'
endif

" NERDTree Settings
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enforcing Purity for myself to not use arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Mappings to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Use Ctrl+H,J,K,L to navigate panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ftz key bindings
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

" Coc Configuration
set hidden                                        " TextEdit might fail if hidden is not set.
set updatetime=300                                " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
set shortmess+=c                                  " Don't pass messages to |ins-completion-menu|.

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart

" Vim-Visual-Multi changing default to Ctrl+d like VSCode
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

" Floaterm Configuration
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" Which Key Configuration
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew ipython3'                          , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'h' : [':FloatermNew htop'                              , 'htop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

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

" Debug feature
let g:termdebug_popup = 0
let g:termdebug_wide = 163
