local cmd = vim.cmd

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

-- Nord Colorscheme
cmd [[autocmd VimEnter * exe ":hi TSVariable gui=none"]]
cmd [[autocmd VimEnter * exe ":hi NeoTreeGitConflict gui=bold guifg=#ff8700"]]
cmd [[autocmd VimEnter * exe ":hi! def link TSTag TSConstructor"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextError guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextWarning guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextInformation guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi LspDiagnosticsVirtualTextHint guifg=#616e88"]]
cmd [[autocmd VimEnter * exe ":hi NeoTreeTitleBar guibg=#d8dee9 guifg=#3b4252"]]
cmd [[autocmd VimEnter * exe ":hi Comment gui=italic"]]
cmd [[autocmd VimEnter * exe ":hi TSComment gui=italic"]]

-- Clear cmd line message
cmd [[autocmd CmdLineLeave * exe ":echo ''"]]
