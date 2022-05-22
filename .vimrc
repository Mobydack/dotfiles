""""""""""""""""""""""""""""
" General                  "
""""""""""""""""""""""""""""
set nocompatible
" Set UTF-8 as standart encoding
set encoding=utf8

"Command for change current directory
command CDC cd %:p:h

" Autoread files change
set autoread
au FocusGained,Bufenter * checktime



""""""""""""""""""""""""""""
" User interface           "
""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
filetype plugin indent on

" Enable display cursor position on ruler
set ruler
set number
set relativenumber
set numberwidth=2

" Highlight search result
set hlsearch

" Whitespace
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
set showbreak=↪️\

"""""""""""""""""""""""""""
" Files, backups          "
"""""""""""""""""""""""""""
" Turn off backups
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""
" Color                   "
"""""""""""""""""""""""""""
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set background=dark
colorscheme PaperColor



"""""""""""""""""""""""""""
" Plugins                 "
"""""""""""""""""""""""""""
call plug#begin()
	Plug 'NLKNguyen/papercolor-theme'
	Plug 'vim-airline/vim-airline'
	Plug 'mhinz/vim-startify'
	Plug 'chriskempson/base16-vim'
	Plug 'mcchrish/nnn.vim'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'yggdroot/indentline'
	Plug 'rust-lang/rust.vim'
	Plug 'majutsushi/tagbar'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-fugitive'
	Plug 'neoclide/coc.nvim', { 'branch': 'release'}
	Plug 'gilligan/vim-lldb'
	Plug 'sheerun/vim-polyglot'
call plug#end()



"""""""""""""""""""""""""""
" NERDTree                "
"""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"""""""""""""""""""""""""""
