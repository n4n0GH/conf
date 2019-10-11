set nocompatible
filetype off

" Plugin management
call plug#begin(stdpath('data') . '/plugged')

" autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni'
Plug 'mhartington/nvim-typescript'

" nerdtree
Plug 'scrooloose/nerdtree'

call plug#end()

" General NVIM Config
" keymappings
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" allow mouse interaction
set mouse=a

" wrap cursor to next/prev line
set ww+=<,>

" set tabstops
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" set up line numbers
set relativenumber
set numberwidth=4
hi LineNr term=bold  cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
	\ gui=NONE guifg=DarkGrey guibg=NONE

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=NONE
	\ guibg=DarkGrey guifg=NONE

" Plugin Specific Configs
" autocompletion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" nerdtree
map <C-n> :NERDTreeToggle<CR>
