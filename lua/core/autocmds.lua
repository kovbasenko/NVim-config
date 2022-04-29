local cmd = vim.cmd

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

-- Nord Colorscheme
cmd [[autocmd VimEnter * exe ":hi TSVariable gui=italic"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextError guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextWarning guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextInformation guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextHint guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi! def link TSTag TSConstructor"]]

-- Clear cmd line message
cmd [[autocmd CmdLineLeave * exe ":echo ''"]]
