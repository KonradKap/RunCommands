set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
		    " Vim will interpret it to be having
		    " a width of 4.
		    "
set shiftwidth=4    " Indents will have a width of 4
		    "
set softtabstop=4   " Sets the number of columns for a TAB
		    "
set expandtab       " Expand TABs to spaces

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins:
Plugin 'derekwyatt/vim-scala'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_goto_buffer_command = 'new-tab'
map <F6> :YcmDiags<CR>
map <leader>f :YcmCompleter GoTo <cr>
map <leader>t :YcmCompleter GetType <cr>

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Bundle 'jistr/vim-nerdtree-tabs'
map <F5> :NERDTreeToggle<CR>

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='distinguished'


highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
colorscheme molokai

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
syntax on

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Better command-line completion
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set relativenumber
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map '\s' to quicky replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Map \x to remove trailing spaces
nnoremap <Leader>x :%s/\s\+$//e <cr> :nohl<cr><C-L>

" Nowrap because I like it (also for guitar tabs)
set nowrap

" Quick session settings
map <F2> :noh <bar> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :mksession! ~/.vim_session <bar> :wqa <cr> " Save and quit with F3
map <F4> :source ~/.vim_session <cr>                " And load session with F4

" Some split settings
set splitbelow
set splitright

set matchpairs+=<:>

" Pressing Ctrl-L leaves insert mode in evim, so why not in regular vim, too.
imap <C-L> <Esc>

set incsearch

nnoremap <C-n> gt
nnoremap <C-b> gT

" // to search for visually selected text
vnoremap // y/\V<C-R>"<CR>
