" NeoVim Config
nmap <leader>, :e ~/.config/nvim/init.vim<CR>

" NERDTree Settings
nnoremap <C-t> :NERDTreeToggle<CR>
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

" Tabbing through buffers
nmap <C-Right> :bn<CR>  " Next buffer in list
nmap <C-Left> :bp<CR>  " Previous buffer in list
nmap <C-S-Left> :b#<CR>  " Previous buffer you were in

" Vim-Visual-Multi changing default to Ctrl+d like VSCode
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
