call plug#begin('~/.config/nvim/plugged')
" Colorschemes
Plug 'sainnhe/everforest'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'

" Commenter
Plug 'scrooloose/nerdcommenter'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Hop
Plug 'phaazon/hop.nvim'

" Ariline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Lua modules
lua require('modules')

set number
set relativenumber
set noswapfile
set shiftwidth=0
set tabstop=2
set updatetime=500
set noshowmode
set noequalalways

" Syntax TS highlight
au BufReadPost *.ts set syntax=javascript
au BufReadPost *.tsx set syntax=javascript

" Theme
syntax enable
if has('termguicolors')
	set termguicolors
endif

" Everforest Theme
set background=dark
let g:everforest_better_performance = 1
" let g:everforest_background = 'hard'

colorscheme everforest
autocmd VimEnter * exe ":hi! def link TSTag Function"

" Indent Line
let g:indentLine_enabled = 0

" NERDCommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }


" <leader> remap
let mapleader = ","

nnoremap <leader>q :q<CR>
nnoremap <leader>a :qa!<CR>
autocmd FileType javascript nnoremap <leader>w :CocCommand prettier.formatFile<CR> :w<CR>
autocmd FileType typescript nnoremap <leader>w :CocCommand prettier.formatFile<CR> :w<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>ob :Telescope buffers<CR>

" Hop
nmap <leader>s :HopWord<CR>
nmap <leader>c :HopChar1<CR>
nmap <leader>l :HopLine<CR>

" Faster scrolling
map <C-j> 10<C-e>
map <C-k> 10<C-y>

" Split Navigation
map <C-h> <C-w>h
map <C-l> <C-w>l

" GitGutter preview
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'

" Snippets TAB usage
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr><CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

"Coc settings
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-prettier',
  \ 'coc-tsserver',
	\ 'coc-styled-components',
  \ ]
autocmd FileType * let b:coc_pairs_disabled = ['<']

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
	set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction

" NERDTree close with last opened file 
autocmd bufenter * if (winnr('$') == 1 && exists ('b:NERDTree')) | q | endif
let g:NERDTreeIgnore = ['^node_modules$']
