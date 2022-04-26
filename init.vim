call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP | Snippets
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Syntax
" Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'ap/vim-css-color'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'

" Surround !TODO
Plug 'tpope/vim-surround'

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
lua require('keymaps')
lua require('settings')

 let g:closetag_filetypes = 'html,xhtml,phtml,typescript.tsx,javascript.jsx,typescriptreact,javascriptreact'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.

let g:closetag_xhtml_filetypes = 'xhtml,jsx,typescript.tsx,javascript.jsx,typescriptreact,javascriptreact'

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

