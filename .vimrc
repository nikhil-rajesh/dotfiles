"-------------Tips-----------------
" o - to create new line and go to insert mode
" tabc - to close a tab
" gt - to switch between tabs
" ts - list all occurence of tag
" tn - next tag
" tp - prev tag " <C-]> - Find the function " <C-^> - Go back from the function after the above tip
" ,gt - generate tags file
" ,f - find using tags
" ls - list all buffers
" A - move to end of line


set backspace=indent,eol,start					"Make backspace sane
set autoindent
set nu								"Numbering for lines
let mapleader = ','

"User system clipboard
set clipboard=unnamedplus

"Setting Tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

"""Cursor (Konsole)
let &t_SI = "\<Esc>]50;CursorShape=1\x7" "Insert Mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7" "Replace Mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" "Normal Mode
"""Cursor settings:
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar


"-------------Plugins-----------------
call plug#begin('~/.vim/plugged')

"
"Colorschemes
"
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'

"
"NERDTree
"
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'universal-ctags/ctags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'othree/html5.vim'
Plug 'happycoder97/expos-vim-plugins'
Plug 'petRUShka/vim-sage'
Plug 'airblade/vim-gitgutter'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'mhinz/vim-startify'

call plug#end()



"-------------Plugins.conf------------
"
"CtrlP
"
"let g:ctrlp_custom_ignore = 'node_modules\.git\dist'
"let g:ctrlp_max_files=20000

"
"Ctags
"
nmap <leader>gt :!ctags -R --exclude=node_modules<cr>
nmap <leader>f :tag<space>

"
"NerdTree
"
nmap <leader>si :NERDTreeToggle<cr>

"
"fzf
"
nmap <C-P> :Files<cr>
nmap <C-F> :Rg<cr>
let g:fzf_colors = {
\	'border' : ['bg', 'Normal'],
\}								"Give the border a color
"For vim 8.1
""let g:fzf_layout = { 'up': '41%' }				"Moves fzf search window to the top
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }	"popup for fzf search window

"
"Coc
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
"To use <cr> for completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"To complete when no option is selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"To format text after completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"
"Airline
"
let g:airline_theme='dracula'
"To enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#branch#enabled=1

"
"Prettier
"
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 1

"
"GitGutter
"
set updatetime=100

"
"VimInstantMarkdown
"
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

"-------------Configs-----------------
set directory=$HOME/.vim/swapfiles//

"-------------Visuals-----------------
colorscheme dracula
set t_CO=256							"Use 256 Colors; for terminal vim
syntax enable
hi  Normal ctermbg=none						"Set same background as terminals



"-------------Search------------------
set hlsearch
set incsearch



"-------------Mappings----------------
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader><space> :nohlsearch<cr>


"-------------Split-Management--------
nmap <C-J> <C-W><C-J>
nmap <C-L> <C-W><C-L>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H> 


"-------------Auto-Commands-----------
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %			"Automatically Source after .vimrc edit
augroup END
augroup expl_ft
  au!
  autocmd BufNewFile,BufRead *.expl   set syntax=c
augroup END

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
