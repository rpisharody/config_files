"Custom .vimrc file developed by Rahul Pisharody
"================================================
"Not compatible with the old vi
set nocompatible
set showmode
set visualbell
set ttyfast
set ruler
"set title

"Automatic reloading of .vimrc
augroup reload_vimrc
    autocmd! bufwritepost .vimrc source %
augroup end

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

"Better copy & paste from terminal Vims (which are all the vims I care about !)
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
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
noremap <Leader>l :set cursorline!<CR>
hi CursorLine cterm=NONE ctermbg=LightGrey ctermfg=black guibg=lightblue guifg=white

"Set smart indentation
set smartindent
set autoindent

"Searching and highlighting
set ignorecase
set smartcase
set hlsearch
set incsearch

nnoremap <BS> :nohlsearch<CR>
vnoremap <BS> :nohlsearch<CR>

"Redraw screen
map <Leader>r :redraw!<CR>

" Insert the present working directory into vim
nnoremap <Leader>d <ESC>:r !pwd<CR><ESC>kJ$a

" Insert today's date into the vim buffer with F5
nnoremap <F5> "=strftime('%b %d %y')<CR>P
inoremap <F5> <C-R>=strftime('%b %d %y')<CR>

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
" This should be taken care of by Chris Toomey's vim-tmux-navigate plugin
" noremap <C-j> <C-w>j
" noremap <C-h> <C-w>h
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
noremap <Leader>n <esc>:tabprevious<CR>
noremap <Leader>m <esc>:tabnext<CR>
noremap <Leader>w <esc>:set wrap!<CR>

"Sizing the split Windows
noremap <Leader>= <C-w>=
noremap <Leader>- <C-w>-
noremap <Leader>0 <C-w>+

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
set background=dark
syntax enable
if ( has("gui_running") )
    set background=light
endif

"Enable syntax highlighting
filetype off
filetype plugin indent on


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

" set number
set relativenumber

try
    colorscheme solarized
catch E185
    colorscheme torte
finally
    let g:solarized_termtrans=1
endtry

" Setup ctags file
set tags=./tags,tags,$HOME

" Setup spell check for Markdown files
augroup markdown_spellcheck
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
    set complete+=kspell
augroup end

" Damian Conway - IBV 2013
"Setting length
"set tw=79
"set nowrap  "Do not automatically wrap on load
"set fo-=t   "Do not automaticaly wrap text while typing
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

augroup bad_whitespace
    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    autocmd BufRead,BufNewFile *.py,*.pl,*.c set list
augroup end

nnoremap ; :
highlight Comment term=bold ctermfg=magenta


" All temporary aliases, commands are sourced from the following file
let b:tmp_file = expand("~/.vimrc.tmp")
if filereadable(b:tmp_file)
    execute "source" . b:tmp_file
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Utility Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>. :call CommaSeparate()<CR>
let g:comma_separated = 0
function! CommaSeparate()
    "
    " This is a function to toggle numbers to have comma separated view
    " When the function is called, 1234 becomes 1,234
    "
    let l:winview = winsaveview()
    if g:comma_separated
        let g:comma_separated = 0
        s/,//g
    else
        try
            s/\(\d\)\(\(\d\d\d\)\+\d\@!\)\@=/\1,/g
            let g:comma_separated = 1
        catch E486
            let g:comma_separated = 0
        endtry
    endif
    call winrestview(l:winview)
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plugins
" Managed by vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" NERDTree Shortcuts
map <Leader>f :NERDTreeToggle<CR>

" tmux sane navigation
Plug 'christoomey/vim-tmux-navigator'

" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'

" vim-airline. Cool !
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
endif

" Scratch buffer for Vim
Plug 'mtth/scratch.vim'
let g:scratch_persistence_file = '/home/rrajan/.scratch'

Plug 'tpope/vim-surround'

Plug 'dietsche/vim-lastplace'

Plug 'tmhedberg/matchit'

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path' : '/nfs/sjo2kanpur.home1/rrajan/notes',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'path_html' : '/nfs/sjo2kanpur.home1/rrajan/notes/export'}]
" I like to write vimwiki in Markdown
autocmd BufNewFile,BufRead *.wiki set syntax=markdown

Plug 'mattn/calendar-vim'
nnoremap <Leader>c :Calendar<CR>

call plug#end()
