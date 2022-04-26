local opt = vim.opt
local cmd = vim.cmd

-- Defaults
opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.shiftwidth = 0
opt.tabstop = 2
opt.updatetime = 500
opt.showmode = false
opt.pumheight = 25
opt.termguicolors = true

-- Highlight TypeScript like JavaScript
cmd([[autocmd BufReadPost *.ts, *.tsx set syntax=javascript]])

-- Enable syntax
cmd([[syntax enable]])

-- EverFotest Theme
opt.background = "dark"
vim.g.everforest_better_performance = 1
cmd("colorscheme everforest")
cmd([[autocmd VimEnter * exe ":hi Purple guifg=#be95c4"]])
cmd([[autocmd VimEnter * exe ":hi! def link TSTag Function"]])

-- Disable Indent line by default
vim.g.indentLine_enabled = 0

-- NERDCommenter
vim.g.NERDSpaceDelims = 1
-- vim.g.NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }
