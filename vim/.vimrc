"
" ██╗   ██╗██╗███╗   ███╗ 
" ██║   ██║██║████╗ ████║ 
" ██║   ██║██║██╔████╔██║ 
" ╚██╗ ██╔╝██║██║╚██╔╝██║ 
"  ╚████╔╝ ██║██║ ╚═╝ ██║ 
"   ╚═══╝  ╚═╝╚═╝     ╚═╝  
"
" ./bogo
"

"
" Set sensible defaults
"
set nocompatible
set smarttab
set backspace=indent,eol,start
set complete-=i
set incsearch
set ruler

syntax on

" Tabs vs Spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Add line numbers to the gutter on the left
set number relativenumber

" Mouse
set mouse=a

" Encoding
set encoding=UTF-8

" Show EOF
set listchars=eol:$

"
" Install plugins via plug.vim
"

" Check, if plug.vim is installed; install if not
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'dracula/vim', {'as':'dracula'}
    Plug 'chriskempson/base16-vim'

    " Tools
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-syntastic/syntastic'
    Plug 'keith/swift.vim'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
call plug#end()

"
" Ultisnips
"

" Snippets are separated from the engine. Add this if you want them:

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"
" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
" Scheme settings
"

" Gruvbox settings
let g:gruvbox_number_column = 'bg1'

colorscheme gruvbox
set background=dark
set t_Co=256
set notermguicolors

" Add NERDTree
let NERDTreeShowHidden=1
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Autocomplete?
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Automatically reload .vimrc
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

