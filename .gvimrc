" remove toolbar
set guioptions-=T

" Shift+Insert will paste from system buffer (Control+C)
cmap <S-Insert>     <C-R>+
exe 'inoremap <script> <S-Insert>' paste#paste_cmd['i']

" right margin ruller
if has("colorcolumn")
    set colorcolumn=100
    hi ColorColumn guibg=#2d2d2d
endif

" setup persisent undo
if has("undofile")
    set undofile
    set undodir=/tmp
endif

filetype on  " Automatically detect file types.

set nocompatible  " We don't want vi compatibility.

set guifont=Monaco\ 10
set hlsearch

set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Visual
set showmatch  " Show matching brackets.

" highlight text after 80 culumn like error
"set textwidth=80

" Text indentation with Alt+[ and so on
nmap <M-Left> <<
nmap <M-Right> >>
vmap <M-Left> <gv
vmap <M-Right> >gv

" Move through buffer tabs
map <M-1> :b1<CR>
map <M-2> :b2<CR>
map <M-3> :b3<CR>
map <M-4> :b4<CR>
map <M-5> :b5<CR>
map <M-6> :b6<CR>
map <M-7> :b7<CR>
map <M-8> :b8<CR>
map <M-9> :b9<CR>
 
map <M-.> :bn<CR>
map <M-,> :bp<CR>

nmap <silent> <M-o> :CommandT<CR>

" ignore following files
set wildignore+=*.bak,*~,*.tmp,*.backup
set wildignore+=*.bak,*~,*.tmp,*.swp

