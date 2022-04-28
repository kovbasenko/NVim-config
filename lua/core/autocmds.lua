local cmd = vim.cmd

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

-- Custom settings
-- cmd [[autocmd VimEnter * exe ":hi NeoTreeGitModified guifg=#7fbbb3 guibg=none"]]
-- cmd [[autocmd VimEnter * exe ":hi NeoTreeGitAdded guifg=#a7c080 guibg=none"]]
-- cmd [[autocmd VimEnter * exe ":hi NeoTreeGitDeleted guifg=#e68e80 guibg=none"]]

-- Nord Colorscheme
cmd [[autocmd VimEnter * exe ":hi TSVariable gui=italic"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextError guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextWarning guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextInformation guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextHint guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi! def link TSTag TSConstructor"]]
