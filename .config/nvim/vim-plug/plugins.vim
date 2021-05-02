" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'jremmen/vim-ripgrep'                          " Regex
Plug 'preservim/nerdtree'                           " A tree explorer plugin for vim.
Plug 'tpope/vim-surround'                           " surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'tpope/vim-commentary'                         " Comment stuff out
Plug 'leafgarland/typescript-vim'                   " Typescript syntax files for Vim
Plug 'sheerun/vim-polyglot'                         " Mega language support pack
Plug 'mbbill/undotree'                              " The undo history visualizer for VIM
Plug 'evanleck/vim-svelte'                          " Vim syntax highlighting and indentation for Svelte 3 components.
Plug 'vim-airline/vim-airline'                      " Awesome status bar
Plug 'vim-airline/vim-airline-themes'               " A collection of themes for vim-airline
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
Plug 'sonph/onehalf', { 'rtp': 'vim' }              " Clean, vibrant and pleasing color schemes for Vim
Plug 'godlygeek/tabular'                            " Vim script for text filtering and alignment
Plug 'plasticboy/vim-markdown'                      " Markdown Vim Mode
Plug 'sainnhe/sonokai'                              " High Contrast & Vivid Color Scheme based on Monokai Pro
Plug 'glepnir/oceanic-material'                     " Oceanic Material Colorscheme on Vim/NeoVim
Plug 'psliwka/vim-smoothie'                         " Smooth scrolling for Vim done rightcup_with_straw
Plug 'honza/vim-snippets'                           " vim-snipmate default snippets

call plug#end()
