"-------------Plugins-----------------
call plug#begin('~/.vim/plugged')

" "Colorschemes "
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'flazz/vim-colorschemes'
"Plug 'arcticicestudio/nord-vim'

"
"NERDTree
"
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'wfxr/minimap.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'universal-ctags/ctags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Chiel92/vim-autoformat'
Plug 'othree/html5.vim'
Plug 'happycoder97/expos-vim-plugins'
Plug 'petRUShka/vim-sage'
Plug 'airblade/vim-gitgutter'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'mhinz/vim-startify'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdcommenter'
Plug 'psliwka/vim-smoothie'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'thaerkh/vim-indentguides'

call plug#end()



"-------------Plugins.conf------------
"
"Minimap
"
let g:minimap_width = 15
let g:minimap_auto_start = 0
nmap <leader>m :MinimapToggle<cr>
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1
let g:minimap_highlight = 'PMenuSel'
let g:minimap_search_color = 'DiffAdd'
let g:minimap_diffadd_color = 'healthSuccess'
let g:minimap_diffremove_color = 'healthError'
let g:minimap_diff_color = 'healthWarning'

"
"Nord-Vim
"
"let g:nord_cursor_line_number_background = 1

"
"Ctags
"
nmap <leader>gt :!ctags -R --exclude=node_modules<cr>
nmap <leader>f :tag<space>

"
"NERDTree
"
nmap <leader>si :NERDTreeToggle<cr>
" Remove the stupid cursorline while scrolling
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Startify | endif
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Startify | NERDTree | endif

"
"Autoformat
"
au BufWrite * :Autoformat
nmap <leader>afv1 :let g:autoformat_verbosemode=1<cr>
nmap <leader>afv0 :let g:autoformat_verbosemode=0<cr>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"
"fzf
"
nmap <C-P> :Files<cr>
nmap <C-F> :Rg<cr>
" let g:fzf_colors = {
"             \   'border' : ['bg', 'Normal'],
"             \}                              "Give the border a color
"For vim 8.1
""let g:fzf_layout = { 'up': '41%' }                "Moves fzf search window to the top
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }    "popup for fzf search window


"
"vim-go
"
let g:go_fmt_command = "goimports"

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
let g:coc_snippet_next = '<s-tab>'

"
"Airline
"
let g:airline_theme='dracula'
"To enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BE"
let g:airline_detect_modified=1

"
"Prettier
"
"let g:prettier#config#print_width = 100
"let g:prettier#config#tab_width = 2
"let g:prettier#config#use_tabs = 'false'
"let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 0

"
"IndentGuids
"
let g:indentguides_tabchar = '┆'
let g:indentguides_spacechar = '|'

"
"GitGutter
"
set updatetime=100
" Default Mappings mess with my buffer change ,h
let g:gitgutter_map_keys = 0

"
"VimInstantMarkdown
"
filetype plugin on
let g:instant_markdown_autostart = 0
nmap <leader>mdp :InstantMarkdownPreview<cr>
nmap <leader>mds :InstantMarkdownStop<cr>

"
"NerdCommenter
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
