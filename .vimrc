"Custom .vimrc file developed by Rahul Pisharody
"================================================
set showmode
set visualbell
set ttyfast
set ruler
"set title
"Not compatible with the old vi
set nocompatible

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source % 

"Set wildcard patterns for navigating help menu
set wildmenu

nmap <F5> :windo set scrollbind!<CR>

"Apparently, the default Vim Regex is broken. Perl/Python formatting 
"will work
"nnoremap / /\v
"vnoremap / /\v

"Set buffer Hidden. This means that you can have unwritten changes to a file
"Open a new file with :e without being forced to write/undo your changes
set hidden

"Setting proper working of backspace key
set backspace=2

"Natural Splitting
set splitright
set splitbelow

"Better copy & paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set clipboard=unnamed

" ===================================================================
" From https://github.com/csswizardry/dotfiles/blob/master/.vimrc
" Start scrolling at 3 lines before bottom and 5 chars before right
set scrolloff=3
set sidescrolloff=5
" Scrolling sideways, scroll one character at a time
set sidescroll=1
" Always have a status line
set laststatus=2
" ===================================================================

"Rebind <Leader> key
let mapleader = ","

"Highlight the Current Line
noremap <Leader>c :set cursorline!<CR>
hi CursorLine cterm=NONE ctermbg=LightGrey ctermfg=black guibg=lightblue guifg=white

"Set smart indentation
set smartindent

"Searching and highlighting
set ignorecase
set smartcase
set hlsearch
set incsearch
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"Redraw screen
map <Leader>r :redraw!<CR>

"To Draw a line with '=' of the same width as the previous line
nnoremap <Leader>1 yypVr=

"Quicksave command
"noremap <C-Z> :update<CR>
"vnoremap <C-Z> <C-C>:update<CR>
"inoremap <C-Z> <C-O>:update<CR>

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
map <Leader>w <esc>:set wrap!<CR>

"Sizing the split Windows
map <Leader>= <C-w>=
map <Leader>- <C-w>-
map <Leader>0 <C-w>+

"Map sort function to a key
vnoremap <Leader>s :sort<CR>

"Easier indenting of codeblocks
vnoremap < <gv
vnoremap > >gv

"Mapping Q to q
ca Q q
ca Wq wq
ca W w
ca WQ wq
ca q1 q!
ca Q1 q!
ca Qa qa

"Color Scheme
"wget -o ~/.vim/colors/wombat256mod.vim 
"http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif
"color slate
"colorscheme desert
syntax enable
if ( ! has("gui_running") )
    set background=dark
endif

"Enable syntax highlighting
syntax enable
filetype off
filetype plugin indent on

"Setting length
set tw=79
"set nowrap  "Do not automatically wrap on load
set fo-=t   "Do not automaticaly wrap text while typing
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

set number

if &listchars ==# 'eol:$'
      set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Startup Pathogen
execute pathogen#infect()

" Set the Solarized Colorschem
syntax enable
set background=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
