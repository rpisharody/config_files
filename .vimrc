
"Custom .vimrc file developed by Rahul Pisharody

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source % 

"Setting proper working of backspace key
set bs=2

"Turn on mouse support in vim
set mouse=a

"Better copy & paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set clipboard=unnamed

"Rebind <Leader> key
let mapleader = ","

"Searching and highlighting
set ignorecase
set smartcase
set hlsearch
set incsearch
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"Quick quit command
noremap <Leader>e <esc>:quit<CR>    "Quit current window
noremap <Leader>E <esc>:qa!<CR>     "Quit all windows

"Bind Ctrl+<movement> keys to move around the windows/tabs
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"Sizing the split Windows
map <Leader>= <C-w>=
map <Leader>- <C-w>-
map <Leader>0 <C-w>+

"Map sort function to a key
vnoremap <Leader>s :sort<CR>

"Easier indenting of codeblocks
vnoremap < <gv
vnoremap > >gv

"Color Scheme
"wget -o ~/.vim/colors/wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
color murphy 

"Enable syntax highlighting
syntax enable
filetype off
filetype plugin indent on

"Showing line numbers and setting length
set number  "Show line numbers
set tw=79
set nowrap  "Do not automatically wrap on load
set fo-=t   "Do not automaticaly wrap text while typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

"Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

"Settings for vi undo history
set history=700
set undolevels=700

"Python specific spatial settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Python Debugging using ipdb
map <Leader>b import ipdb as pdb; pdb.set_trace()<esc>:w<CR>

"==============================================================================
"Python IDE Setup
"==============================================================================
"Set up Pathogen - The Modern way to load Vim Plugins
"Instructions : https://github.com/tpope/vim-pathogen
"mkdir -p ~/.vim/; cd .vim; git clone git://github.com/tpope/vim-pathogen.git
"
call pathogen#infect()
call pathogen#helptags()

"Colorscheme : Solarized
"set background=dark
"set t_Co=16
"let g:solarized_termcolors=16
"colorscheme solarized

"Set up Powerline
"Clone in ~/.vim/bundle
"git clone git://github.com/tpope/vim-pathogen.git
"Settings for powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

"Setup python-mode
"Clone in ~/.vim/bundle
"git clone git://github.com/klen/python-mode.git
"Settings for python-mode
let g:pymode_rope_goto_def_newwin = "vnew"

"omnicomplete
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>
