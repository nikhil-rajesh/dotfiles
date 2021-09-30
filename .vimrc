"-------------Tips-----------------
" o - to create new line and go to insert mode
" tabc - to close a tab
" gt - to switch between tabs
" ts - list all occurence of tag
" tn - next tag
" tp - prev tag
" <C-]> - Find the function
" <C-^> - Go back from the function after the above tip
" ,gt - generate tags file
" ,f - find using tags
" ls - list all buffers
" A - move to end of line
" jk - Insert mode to Normal mode
" ,jp - XSM Shortucut to insert jmp line number


let mapleader = ','
" set list lcs=trail:·,precedes:«,extends:»

" This script contains plugin specific settings
source ~/.vim/plugins.vim



"-------------Functions----------------
function! XSM_Jmp()
    let x = input('Enter Line Number: ')
    return (x-5)*2 + 2048
endfunction



"-------------Mappings----------------
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>ep :e $HOME/.vim/plugins.vim<cr>
nmap <leader><space> :nohlsearch<cr>
inoremap jk <ESC>
imap <leader>jp <C-R>=XSM_Jmp()<CR>



"-------------Configs-----------------
set directory=$HOME/.vim/swapfiles//                            "Swapfile directory
set backspace=indent,eol,start					"Make backspace sane
set autoindent
set nu								"Numbering for lines
set relativenumber
set clipboard=unnamedplus                                       "User system clipboard
set mouse=a                                                     "Use Mouse for changing split size

set tabstop=4                                                   ""
set softtabstop=4                                               "Setting Tabs
set shiftwidth=4                                                ""
set expandtab													""



"-------------Visuals-----------------
let ayucolor="mirage"
set t_CO=256							"Use 256 Colors; for terminal vim
set termguicolors
colorscheme ayu
set cursorline
set conceallevel=0
syntax enable
hi VertSplit cterm=NONE
" hi Normal guibg=NONE ctermbg=none|						"Set same background as terminals

"""Different Cursor for different Modes (Konsole)
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"  "Insert Mode
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"  "Replace Mode
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"  "Normal Mode
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"                        "Insert Mode
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"                        "Replace Mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"                        "Normal Mode
endif
"""Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar



"-------------Search------------------
set hlsearch
set incsearch



"-------------Split-Management--------
nmap <C-J> <C-W><C-J>
nmap <C-L> <C-W><C-L>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nnoremap <silent> <c-Up> :resize -1<CR>
nnoremap <silent> <c-Down> :resize +1<CR>
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>



"-------------Buffer-Management--------
" To open a new empty buffer
nmap <leader>T :enew<CR>
" Move to the previous buffer
nmap <leader>h :bprev<CR>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>




"-------------Auto-Commands-----------
augroup autosourcing
        autocmd!
        autocmd BufWritePost .vimrc source %			"Automatically Source after .vimrc edit
        autocmd BufWritePost plugins.vim source %		"Automatically Source after plugins.vim edit
augroup END
augroup expl_ft
  au!
  autocmd BufNewFile,BufRead *.expl   set syntax=c
augroup END

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
