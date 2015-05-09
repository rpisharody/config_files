" Custom .vimrc for use by Rahul Pisharody
" ========================================

" Break away from vi behavior. Use vim behavior
set nocompatible
" Some general vim niceities !
set visualbell
set ttyfast
set ruler
set number
syntax enable
filetype plugin indent on
set incsearch
set ignorecase
set hlsearch
set smartcase
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Make vim work as expected during fast keypresses :P
ca Q q
ca Wq wq
ca W w
ca WQ wq
ca q1 q!
ca Q1 q!
ca Qa qa

" Rebind <leader> ley to ,
let mapleader = ","

" Reload .vimrc when the file is saved
autocmd! bufwritepost .vimrc source %

" Wildcards while navigating help menu
set wildmenu

"Set buffer Hidden. This means that you can have unwritten changes to a file
"Open a new file with :e without being forced to write/undo your changes
set hidden

" Set backspace key to work as expected in all other applications
set backspace=2

" Natural splitting in vim
set splitbelow
set splitright

" ===================================================================
" From https://github.com/csswizardry/dotfiles/blob/master/.vimrc
" Start scrolling at 3 lines before bottom and 5 chars before right
set scrolloff=3
set sidescrolloff=5
" Scrolling sideways, scroll one character at a time
set sidescroll=1
" Always, always show a status line. Plays well with vim-airline
set laststatus=2
" ===================================================================

" Set the width of the term window
set tw=79
set fo-=t
highlight ColorColumn ctermbg=233

" vim undo history settings
set history=700
set undolevels=700

" Custom Keymappings
" ------------------
" Useful when working with vimdiff. Lockdown one window while scrolling the other
nmap <F5> :windo set scrollbind!<CR>
" ,r triggers the 'set number' setting
nmap <leader>r :set number!<CR>
"Better copy & paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" Highlight the current line ?
noremap <leader>c :set cursorline!<CR>
" Turn off highlighting after searches
map <C-n> :nohl<CR>
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
map <Leader>[ <C-w>-
map <Leader>] <C-w>+

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Custom functions
" ================
" Restores vim to the position in a last edited file. Uses ~/.viminfo for
" figuring out the position
function! ResCur()
    if line ("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END


execute pathogen#infect()

" For Solarized
set background=dark
colorscheme solarized

" For vim-airline
" For vim-markdown
