" Stop behaving like vi; vim enhancements are better
set nocompatible

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

""" Folding
set foldmethod=indent       " By default, use syntax to determine folds
set foldlevelstart=99       " All folds open by default

set number                  " Display line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set background=dark

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=100
endif

""" Messages, Info, Status
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Tabs/Indent Levels
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set autoindent              " Keep indentation level from previous line
set textwidth=79            " 

""" Command Line
set history=1000            " Keep a very long command-line history.
set wildmenu                " Menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.

""" Per-Filetype Scripts
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
let python_highlight_space_errors=0
syntax on
" Automatically indent based on file type
filetype indent on
" Folding based on indentation
set foldmethod=indent
" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=100

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

""" Display
colorscheme darkmate
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

""" OTHER SETTINGS
" set <leader> as ,
let mapleader = ","

nnoremap <leader><space> :noh<cr>  " Empty highlight after search by leader - space

"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``  " Trim Trailing Whitespace

""" TABS navigation after :tabnew opens up a file in a new tab
" map <silent><A-Right> :tabnext<CR>       " :tabn
" map <silent><A-Left> :tabprevious<CR>    " :tabp
" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

""" PYDOC path
" let g:pydoc_cmd=/usr/bin/pydoc

 
" ------------------------------------------------------------------------------
" NERDTree Settings
" ------------------------------------------------------------------------------
" Hide python cache files (.pyc) in NERDTree
let NERDTreeIgnore=['\.pyc']
" open NERDTree with start directory
nnoremap <F9> :NERDTreeToggle ~/projects/<CR>
let NERDTreeShowBookmarks=1

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
echohl ErrorMsg
echomsg a:msg
echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
    if empty(a:buffer)
        let btarget = bufnr('%')
    elseif a:buffer =~ '^\d\+$'
        let btarget = bufnr(str2nr(a:buffer))
    else
        let btarget = bufnr(a:buffer)
    endif
    if btarget < 0
        call s:Warn('No matching buffer for '.a:buffer)
        return
    endif
    if empty(a:bang) && getbufvar(btarget, '&modified')
        call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
        return
    endif
    " Numbers of windows that view target buffer which we will delete.
    let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
    if !g:bclose_multiple && len(wnums) > 1
        call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
        return
    endif
    let wcurrent = winnr()
    for w in wnums
        execute w.'wincmd w'
        let prevbuf = bufnr('#')
        if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
            buffer #
        else
            bprevious
        endif
        if btarget == bufnr('%')
            " Numbers of listed buffers which are not the target to be deleted.
            let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
            " Listed, not target, and not displayed.
            let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
            " Take the first buffer, if any (could be more intelligent).
            let bjump = (bhidden + blisted + [-1])[0]
            if bjump > 0
                execute 'buffer '.bjump
            else
                execute 'enew'.a:bang
            endif
        endif
    endfor
    execute 'bdelete'.a:bang.' '.btarget
    execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
nnoremap <silent> <Leader>bD :Bclose!<CR>
"-------------------------------------------------------------------------------
" unimpaired
"-------------------------------------------------------------------------------
" Text movimg with plugin unimpaired.vim
" Bubble single lines

nmap <M-Up> [e
nmap <M-Down> ]e

" Bubble multiple lines
vmap <M-Up> [egv
vmap <M-Down> ]egv

" insert empty lines in normal mode
nnoremap <Enter> o<ESC>
"nnoremap <M-Enter> O<ESC>
