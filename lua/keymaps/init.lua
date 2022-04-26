local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Change leader to a comma
vim.g.mapleader = ","

-- Disable arrows navigation
map("", "<up>", "", { noremap = true, silent = false })
map("", "<down>", "", { noremap = true, silent = false })
map("", "<left>", "", { noremap = true, silent = false })
map("", "<right>", "", { noremap = true, silent = false })

-- Fast commands
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>a", ":qa!<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>ob", ":Telescope buffers<CR>", opts)

-- Hop
map("n", "<leader>s", ":HopWord<CR>", opts)
map("n", "<leader>c", ":HopChar1<CR>", opts)
map("n", "<leader>l", ":HopLine<CR>", opts)

-- Faster scrolling
map("n", "<C-j>", "10<C-e>", opts)
map("n", "<C-k>", "10<C-y>", opts)

-- Split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- GitGutter
map("n", "ghp", ":GitGutterPreviewHunk<CR>", opts)
map("n", "ghs", ":GitGutterStageHunk<CR>", opts)
map("n", "ghu", ":GitGutterUndoHunk<CR>", opts)

-- NerdCommenterToggle
map("n", "++", ':call nerdcommenter#Comment(0, "toggle")<CR>', { noremap = true })
map("v", "++", ':call nerdcommenter#Comment(0, "toggle")<CR>', { noremap = true })
