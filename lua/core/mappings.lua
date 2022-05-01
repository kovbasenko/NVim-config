local map = vim.keymap.set
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local silent = { silent = true }

-- Remap space as leader key
vim.g.mapleader = ","

-- Disable Ex mode:
map("n", "Q", "<Nop>")

-- Disable arrows navigation
map("", "<up>", "<Nop>")
map("", "<down>", "<Nop>")
map("", "<left>", "<Nop>")
map("", "<right>", "<Nop>")

-- Faster cursor move
map("n", "<S-k>", "4k")
map("n", "<S-j>", "4j")
map("n", "<Esc>", "<cmd>nohlsearch<CR> | <cmd>echo ''<CR>")

-- Hop
map("n", "<leader>sw", ":HopWord<CR>", { noremap = true, silent = true })
map("n", "<leader>sc", ":HopChar1<CR>", { noremap = true, silent = true })
map("n", "<leader>sl", ":HopLine<CR>", { noremap = true, silent = true })

-- Navigate buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
map("n", "<leader>oc", "<cmd>BufferLineCloseRight<cr> | <cmd>BufferLineCloseLeft<cr>", { desc = "Close other tabs" })
-- map("n", "}", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
-- map("n", "{", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Standard Operations
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quite" })
map("n", "<leader>a", "<cmd>qa!<CR>", { desc = "Abaddon" })

-- Search Replace in a current buffer
map("n", "<leader>r", ":%s///g<left><left>")
map("n", "<leader>rc", ":%s///gc<left><left><left>")
-- Replace on selected area
map("x", "<leader>r", ":s///g<left><left>")
map("x", "<leader>rc", ":s///gc<left><left><left>")
-- Replace current + "."
map("n", "s*", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", silent)
map("x", "s*", '"sy:let @/=@s<CR>cgn', silent)

-- Move lines
map("n", "<A-K>", "<cmd>m .-2<CR>==", silent)
map("n", "<A-J>", "<cmd>m .+1<CR>==", silent)
map("i", "<A-L>", "<cmd>m .-2==gi<CR>", silent)
map("i", "<A-J>", "<cmd>m .+1==gi<CR>", silent)
map("v", "<A-K>", ":m '<-2<CR>gv=gv", silent)
map("v", "<A-J>", ":m '>+1<CR>gv=gv", silent)

-- TAB
map("n", "<Tab>", "<cmd>><CR>")
map("n", "<S-Tab>", "<cmd><<CR>")
map("i", "<S-Tab>", "<C-D>")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Move cursor in insert mode
map("i", "<A-h>", "<left>")
map("i", "<A-j>", "<down>")
map("i", "<A-k>", "<up>")
map("i", "<A-l>", "<right>")

-- Close current buffer
map("n", "<leader>c", "<cmd>Bdelete!<CR>", { desc = "Delete buffer" })

-- LSP
map("n", "<leader>lf", vim.lsp.buf.formatting_sync, { desc = "Format code" })
map("n", "<leader>ll", vim.lsp.buf.implementation, { desc = "LSP code action" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename current symbol" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover symbol details" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current symbol" })
map("n", "{", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "}", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Better window navigation
local sp = require "smart-splits"
map("n", "<C-h>", sp.move_cursor_left)
map("n", "<C-j>", sp.move_cursor_down)
map("n", "<C-k>", sp.move_cursor_up)
map("n", "<C-l>", sp.move_cursor_right)

-- GitSigns
local gs = require "gitsigns"
map("n", "<leader>gj", gs.next_hunk, { desc = "Next git hunk" })
map("n", "<leader>gk", gs.prev_hunk, { desc = "Previous git hunk" })
map("n", "<leader>gl", gs.blame_line, { desc = "View git blame" })
map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview git hunk" })
map("n", "<leader>gh", gs.reset_hunk, { desc = "Reset git hunk" })
map("n", "<leader>gr", gs.reset_buffer, { desc = "Reset git buffer" })
map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage git hunk" })
map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Unstage git hunk" })
map("n", "<leader>gd", gs.diffthis, { desc = "View git diff" })

-- Telescope
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" }, silent)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Telescope git branchs" }, silent)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" }, silent)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope search buffers" }, silent)

-- Comment
map("n", "<leader>/", require("Comment.api").toggle_current_linewise, { desc = "Toggle comment line" })

-- SymbolsOutline
map("n", "<leader>lS", "<cmd>SymbolsOutline<CR>", { desc = "Symbols outline" })

-- Comment
map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment line" }
)

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { desc = "Terminal left window navigation" })
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { desc = "Terminal down window navigation" })
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { desc = "Terminal up window navigation" })
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { desc = "Terminal right window naviation" })
end

augroup("TermMappings", {})
cmd("TermOpen", {
  desc = "Set terminal keymaps",
  group = "TermMappings",
  callback = _G.set_terminal_keymaps,
})
