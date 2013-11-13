To install plugins:
apt-get install git ctags
cd bundle && while read repo; do git clone $repo; done < ../installed_plugins.txt 
ln -s ~/.vim/.vimrc ~
ln -s ~/.vim/.gvimrc ~



snipmate
taglist
folding
pydoc
ipdb
tasklist
nerdtree
snippets
syntax
fast open

installed exuberant-ctags -> TT, F4 = TlistToggle

------------
|   HELP   |
------------
:! command in shell
:noh - clear selection after search
Shift + e - execute python file
* - highlight matched words under cursor
% - Jump to matching {}, (), [], ...
CTRL-a 	Increment number right of the cursor
CTRL-x 	Decrement number right of the cursor
CTRL-n and CTRL-p Complition
~       Campitalize letter under cursor
:%s/<what_to_replace>/<on_what_to_replace>/gc - ask on each replacement

CTRL-v 	Visual select block mode

    once you have rectangular block, you can remove block with 'd'
    insert text in front of the block with capital 'I'
    append text after the block with capital 'A'
    change text with 'c'
    cut text using 'x' and paste using 'p'
    change text to single characters using 'R' 
-----------------
Buffers
-----------------
:bw - close buffer ?
Alt + number  - move by buffer number
Alt + .,  - moving through buffers

-----------------
Completion
-----------------
Tab - complete snippet
Ctrl+x Ctrl+o - omni completion 

-----------------
Folding
-----------------
F - toggle all, f-toggle folding only here
:TaskList

------------------------
# Check Python code
------------------------
:!pep8 %
:!pyflakes %
:!pylint %

\pw - pydoc

---------------
NERDTREE:
---------------
:NERDtree
F9 - open or hide NerdTree on path /mnt/admitad/var/www/
q - close
m - on file/dir to copy/dell/add child node/move


--------------
Indentation
--------------
<number>  Alt + arrows


--------------
unimpaired
--------------
Alt + arrows - moves lines

---------------
BuffExplorer
--------------
Ctrl + arrows - moving through buffers


----------------
Leader button <,>
----------------
:noh or ,<space> - clear selection after search



----
TOSEE
----


gq 	Word wrap - make text, comments look nicer
 :ls 	List buffers
 :b1 - :bn 	Switch to buffer n - :b5 - switch to buffer 5
 :sbn 	Same as :b1 - :bn, but split
 :CTRL-w q 	Close current buffer/window
 :on 	Show only current buffer
set wildmode=longest 	Tab clompletion behaves more like in emacs or zsh. To get the full list, press CTRL-D
set autochdir 	Automatically cd to directory of the buffer. This is a great feature, but it only seems to work on certain VIM clients even though it is in the help file.
set selection=exclusive 	Only select up to (not including) the character where cursor is
CTRL-^ 	Switch buffer
CTRL-w CTRL-^ 	Split and switch
set path=/some/path/** 	Set internal find path to /some/path and all subdirectories
 :find file 	Search for file in the path
CTRL-] 	Jump to label
CTRL-T 	Go back
] CTRL-i 	Jump to file under cursor
[ SHIFT-i 	Display all occurances of the word under the cursor in the file 
