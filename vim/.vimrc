syntax on                            " Syntax on 

set number
set hidden                           " Allow buffers change without saving them
set incsearch
set tabstop=4
set softtabstop=4                 
set shiftwidth=4
"set textwidth=80
"set colorcolumn=+1
set background=dark

command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

let mapleader = "\<Space>"

imap jj <esc>

map <F7> :echo 'Current time is ' . strftime('%c')<cr>
map <F3> <esc>:echo "EXIT" <bar> :q <cr>

nmap <leader>v :vsplit<cr>
nmap <leader>vr :tabedit $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
