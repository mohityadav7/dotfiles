syntax on

" =============================== SETS ===============================
"set noerrorbells
"set nowrap
"set noswapfile
"set nobackup
"set incsearch
"set colorcolumn=80
set scrolloff=6
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set smartcase
set undofile
set guifont=DankMono:h14
if has("unix")
    set undodir=~/.config/nvim/undodir
else
    set undodir=~/AppData/Local/nvim/undodir
endif


" ============================== PLUGINS ==============================
" -------------- OS dependent config for Plug -------------
if !exists("g:vscode")
    if has("unix")
        call plug#begin('~/.config/nvim/plugged')
    else
        call plug#begin('~/AppData/Local/nvim-data/plugged')
    endif

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'ThePrimeagen/vim-be-good'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" ------------- color schemes -------------
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'

call plug#end()
endif


" ========================== COLOR SCHEMES ============================
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="dark"   " for dark version of theme
let ayucolor="mirage"   " for mirage version of theme
colorscheme onedark
" Set background transparent, after setting color scheme
" hi Normal guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE


" ============================ REMAPS ================================
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>v <C-v>

" fzf
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" In visual mode, paste while maintaining the current copied content
vnoremap <leader>p "_dP
" Enter visual block mode, ^v doesn't work because WT uses it for pasting
nnoremap <leader>v <C-v>
" Copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG<C-o>
" Move lines up/down, Alt up/down for single line
nnoremap <A-j> :m+1<CR>==
nnoremap <A-k> :m-2<CR>==
" Move selection up/down using J/K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Navigate to next/prev in quickfix list
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" Because ^Z doesn't work as expected on Windows
if has("win32") && has("nvim")
    nnoremap <C-z> <nop>
    inoremap <C-z> <nop>
    vnoremap <C-z> <nop>
    snoremap <C-z> <nop>
    xnoremap <C-z> <nop>
    cnoremap <C-z> <nop>
    onoremap <C-z> <nop>
endif

" ===================== source config from other sources =====================
" need to source after all bindings
" source $HOME/.config/nvim/keys/which-key.vim


