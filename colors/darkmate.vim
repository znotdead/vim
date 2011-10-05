" Vim color file
"
" Author: Liudmila Rahalevich (Kavalevich)  znotdead <zhirafchik@gmail.com> 
"
" Note: Based on Darkmate color scheme for gedit (gtk-source-view)
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
let s:gray    = "#bbbbbb"
let s:white   = "#eeeeee"
"let s:yellow  = "#fce94f"
let s:yellow  = "#fff700"
let s:senape  = "#acc900"
let s:lime    = "#96ff00"
let s:green   = "#00c900"
let s:alga    = "#00c99b"
let s:aqua    = "#00d8ff"
let s:cyan    = "#009cff"
let s:violet  = "#9e91ff"
let s:purple  = "#bb66ff"
let s:fuchsia = "#ff44cc"
"let s:magenta = "#ff79d9"
let s:magenta = "#ff2f6a"
"let s:red     = "#ff2f6a"
let s:red     = "#ff5050"
let s:orange  = "#ff6100"
let s:ambra   = "#ff9900"
let s:asfalto = "#555753"
let s:carbon  = "#232323"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="darkmate"

exe 'hi Normal guifg=' . s:white . ' guibg=' . s:carbon

" highlight groups
hi Cursor		guibg=#ffffff guifg=#000000
hi CursorLine	guibg=#000000
"hi CursorLine	guibg=#3e4446
hi CursorColumn	guibg=#464646

"hi DiffText     guibg=#4e9a06 guifg=#FFFFFF gui=bold

exe 'hi DiffAdd         guifg=' . s:lime . ' gui=none'
exe 'hi DiffChange      guifg=' . s:ambra . ' gui=none'
hi DiffText        guifg=#8ae234 guibg=#4e9a06 gui=none
exe 'hi DiffDelete      guifg=' . s:magenta . ' gui=none'
"hi ErrorMsg

hi Folded		guibg=#000000 guifg=#FFFFFF gui=bold
hi vimFold		guibg=#000000 guifg=#FFFFFF gui=bold
hi FoldColumn	guibg=#000000 guifg=#FFFFFF gui=bold

exe 'hi LineNr		guifg=' . s:asfalto . ' guibg=' . s:carbon
hi NonText		guifg=#535353 guibg=#202020
hi Folded		guifg=#535353 guibg=#202020 gui=bold
hi FoldeColumn  guifg=#535353 guibg=#202020 gui=bold
"hi VertSplit	guibg=#ffffff guifg=#ffffff gui=none

hi VertSplit	guibg=#3C3C3C guifg=#3C3C3C gui=none
hi StatusLine   guifg=#FFFFFF guibg=#3C3C3C gui=none
hi StatusLineNC guifg=#808080 guibg=#3C3C3C gui=none

hi ModeMsg		guifg=#fce94f
hi MoreMsg		guifg=#fce94f
hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
exe 'hi IncSearch	guibg=' . s:ambra . ' guifg=' . s:carbon
exe 'hi Search		guibg=' . s:yellow . ' guifg=' . s:carbon
hi SpecialKey	guifg=#8ae234

hi Title		guifg=#ef5939
hi WarningMsg	guifg=#ef5939
exe 'hi Number		guifg=' . s:alga

exe 'hi MatchParen	guibg=' . s:carbon . ' guifg= ' . s:aqua
exe 'hi Comment		guifg=' . s:purple
exe 'hi Constant	guifg=' . s:yellow . ' gui=none'
exe 'hi String		guifg=' . s:lime
exe 'hi Boolean     guifg=' . s:magenta
exe 'hi Identifier	guifg=' . s:green . ' gui=bold'
exe 'hi Statement	guifg=' . s:ambra . ' gui=bold'
exe 'hi Exception   guifg=' . s:cyan
exe 'hi PreProc		guifg=' . s:aqua
hi Type			guifg=#8ae234 gui=bold
exe 'hi Special		guifg=' . s:violet
hi Underlined	guifg=#ad7fa8 gui=underline
hi Directory	guifg=#729fcf
hi Ignore		guifg=#555753
exe 'hi Todo			guifg=' . s:white . ' guibg=' . s:fuchsia . ' gui=bold'
exe 'hi Error			guifg=' . s:white . ' guibg=' . s:red
exe 'hi Function		guifg=' . s:orange

"hi WildMenu     guibg=#2e3436 guifg=#ffffff gui=bold
"hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none
hi WildMenu     guifg=#ffffff guibg=#3465a4 gui=none

hi Pmenu        guibg=#000000 guifg=#c0c0c0
hi PmenuSel     guibg=#3465a4 guifg=#ffffff
hi PmenuSbar    guibg=#444444 guifg=#444444
hi PmenuThumb   guibg=#888888 guifg=#888888 

hi cppSTLType   guifg=#729fcf gui=bold

hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#ad7fa8
hi spellLocal   guisp=#729fcf

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Use the below highlight group when displaying bad whitespace is desired.
exe 'hi BadWhitespace guibg=' . s:red

hi link cppSTL          Function
hi link Character		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link pythonSharpBang	Special
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant

" tabs (non gui)
hi TabLine		guifg=#A3A3A3 guibg=#202020 gui=none
hi TabLineFill	guifg=#535353 guibg=#202020 gui=none
hi TabLineSel	guifg=#FFFFFF gui=bold
"hi TabLineSel	guifg=#FFFFFF guibg=#000000 gui=bold
" vim: sw=4 ts=4
hi colorcolumn guifg=#FFFFFF guibg=#202020

" Python specific
exe 'hi pythonReserved  guifg=' . s:senape . ' gui=bold'
exe 'hi pythonDecorator guifg=' . s:magenta
