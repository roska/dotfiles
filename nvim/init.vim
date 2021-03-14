" NeoViM

" Set leader key
let mapleader = ' '

" Config shortcuts
" ================
" Open main config file (aka this file)
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>ep :e ~/.config/nvim/plugins.vim<cr>

"so ~/.config/nvim/plugins.vim

" Plugins
" =======
call plug#begin('~/.config/nvim/plugged')

"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'


Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

Plug 'morhetz/gruvbox'

call plug#end()

" Fix the stupid
" ==============

syntax enable
"set termguicolors


" Allow multiple unsaved files to be open 
set hidden


" Fix tabs
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab


" Splits
" Change where new splits go when they open
" New Horizontal split pane goes to bottom
set splitbelow 
" New Vertical split pane goes to right
set splitright 


" Search
set ignorecase " Ignore case sensitivity
set smartcase  " be case sensitive when search pattern contains uppercase character


" Basics
" ======
colorscheme gruvbox
"set background=dark


" Line numbers
" `set number` actives the line numbers
" `set relativenumber` show the relative numbers to current line
"
set number 
set relativenumber

set showcmd


" TODO: test
"highlight Comment cterm=italic


" Set line number color
highlight LineNr ctermfg=grey

"set cursorline
highlight CursorLine ctermbg=black 
highlight CursorLineNr ctermfg=white		

set cursorline


" Key bindings
" ============
" Quickly leave insert mode by pressing `j` twice
imap jj <esc>
" [j+j]

" Save (write) file quickly 
nmap <Leader>w :w<cr> 
" [space+w]

" Close window quickly 
nmap <Leader>q :q<cr>
" [space+q] 

" Close file (buffer) quickly
" [space+d]
nmap <Leader>d :bd<cr>

" Remove search highlights
nmap <Leader><space> :nohlsearch<cr>

" Quickly change active split with `ctrl + hjkl` -keys
" [ctrl-h, ctrl-j, ctrl-k, ctrl-l]
nmap <C-H> <C-W><C-H> 
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>


" FZF ctrl-p
nmap <C-p> :GFiles<cr>
nmap <leader>p :Files<cr>
nmap <C-t> :Buffers<cr>


nnoremap <leader>t :NERDTreeToggle<CR>


" Plugin configurations
" =====================

" vim-airline
" ===========
" Show buffers on the top
let g:airline#extensions#tabline#enabled = 1
" Show buffer numbers
let g:airline#extensions#tabline#buffer_nr_show = 1

" lightline
" ---------

" Disable basic mode text
set noshowmode " Do not show `-- INSERT --` under line
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
let g:lightline.colorscheme = 'gruvbox'


set showtabline=2
let g:lightline#bufferline#show_number  = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" ALE

" Set ESLint as javascript linter
"let g:ale_fixers = {
" \ 'javascript': ['eslint']
" \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1



" Autoload vim config file when this file is saved
augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source %
augroup END
