set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle config
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundle-plugins')

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-sleuth'
Plugin 'flazz/vim-colorschemes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'godlygeek/csapprox'
Plugin 'vim-scripts/AutoComplPop'

call vundle#end()

" Line numbers
set number

set nowrap
set backspace=2
set tabstop=2
set expandtab
set shiftwidth=2

" Enable filetype plugins
filetype plugin on
filetype indent on

" set Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Mouse scrolling
set mouse=nicr

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Leave lines at bottom and top while moving in normal mode
set so=7

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=0

" Enable syntax highlighting
syntax enable

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
" """"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite * :call DeleteTrailingWS()
autocmd BufWrite * :call DeleteTrailingWS()

let g:ycm_key_list_select_completion = ['<Tab>']

" Set different colorscheme for terminal
colorscheme gruvbox

if has("gui_macvim")
  set guifont=Consolas:h13

  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.pyc$'
let g:ctrlp_working_path_mode = 0
let g:ycm_autoclose_preview_window_after_completion = 1

" Visual line movements. j and k respect wrapped lines.
nnoremap j gj
nnoremap k gk

" Warn if file changed on disk
:au FileChangedShell * echo "Warning: File changed on disk"

" Latex specific settings
func! CheckWrapping()
  if &filetype == "plaintex" || &filetype == "tex"
    set linebreak
    set wrap
  else
    set nolinebreak
    set nowrap
  endif
endfunc

autocmd FileType * :call CheckWrapping()

set clipboard=unnamed

