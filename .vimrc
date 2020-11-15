call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-scripts/vim-auto-save'
Plug 'neoclide/coc.nvim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax on
set guicursor=
set relativenumber
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
filetype plugin on
filetype indent on
let mapleader = ","
nnoremap <F1> :let @/ = ""<CR>

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Color scheme
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme gruvbox
set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Auto save config
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" Movement
inoremap jj <ESC>
inoremap kk <ESC>
inoremap hh <ESC>
vnoremap <leader>p "_dp

" Movement between split screens
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

nnoremap <leader>u :UndotreeToggle<CR>
noremap <Leader>y "*y
noremap <Leader>p "*p

" vim Fugitive Config
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>gp :Gpush<CR>

" Vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fname = 'default'

" Coc config
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

autocmd FileType python let b:coc_suggest_disable = 1

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remove white space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

inoremap <expr><S-TAB> \<C-p>
let g:kite_supported_languages = ['python', 'javascript']
nnoremap <leader>gd :KiteGotoDefination<CR>
