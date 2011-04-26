" Stop behaving like vi; vim enhancements are better
set nocompatible

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Folding
set foldmethod=indent       " By default, use syntax to determine folds
set foldlevelstart=99       " All folds open by default

set number                  " Display line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set background=dark

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

"""" Messages, Info, Status
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

"""" Tabs/Indent Levels
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth

"""" Command Line
set history=1000            " Keep a very long command-line history.
set wildmenu                " Menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.

"""" Per-Filetype Scripts
" NOTE: These define autocmds, so they should come before any other autocmds.
"       That way, a later autocmd can override the result of one defined here.
filetype on                 " Enable filetype detection,
filetype indent on          " use filetype-specific indenting where available,
filetype plugin on          " also allow for filetype-specific plugins,
syntax on                   " and turn on per-filetype syntax highlighting.

" treat html files as django templates
so $HOME/.vim/myfiletypes.vim
autocmd BufRead *.html set filetype=htmldjango

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set encoding=utf-8 " Set the default file encoding to UTF-8
" For full syntax highlighting:
let python_highlight_all=1
syntax on
" Automatically indent based on file type
filetype indent on
" Keep indentation level from previous line
set autoindent
" Folding based on indentation
set foldmethod=indent
" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

if has("python")
python << EOF
import os
import sys
import vim
# lets us use 'gf' to go to files imported
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# lets us execute the highlighted portion of the script
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOF
endif

"""" Display
colorscheme darkmate
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59