if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml_dir = expand('~/.vim/rc')

    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

    
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
    
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" 初期設定
filetype plugin indent on

syntax on

set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent

set ruler
set number
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab
set tags=/home/yukimat/tags

set clipboard=unnamed
set tags=/home/yukimat/tags
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<Left>
inoremap " ""<Left>
" 初期設定終わり

" nerdtree
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd vimenter * NERDTree
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" end nerdtree

"color scheme
colorscheme molokai
set background=dark
set t_Co=256
"end color scheme

"ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_statusline_format = ['%d', '/ %d', '']
"end ALE
" airline
set laststatus=2
" end airline
