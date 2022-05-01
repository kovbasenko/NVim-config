local M = {}

local utils = require "core.utils"

local map = vim.keymap.set
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local silent = { silent = true }

-- Remap space as leader key
vim.g.mapleader = ","

-- Disable arrows navigation
map("", "<up>", "", { noremap = true, silent = false })
map("", "<down>", "", { noremap = true, silent = false })
map("", "<left>", "", { noremap = true, silent = false })
map("", "<right>", "", { noremap = true, silent = false })

map("n", "<S-k>", "4k")
map("n", "<S-j>", "4j")
map("n", "<Esc>", "<cmd>nohlsearch<CR> | <cmd>echo ''<CR>")

-- Normal --
if utils.is_available "smart-splits.nvim" then
  local sp = require "smart-splits"

  -- Better window navigation
  map("n", "<C-h>", function()
    sp.move_cursor_left()
  end, { desc = "Move to left split" })
  map("n", "<C-j>", function()
    sp.move_cursor_down()
  end, { desc = "Move to below split" })
  map("n", "<C-k>", function()
    sp.move_cursor_up()
  end, { desc = "Move to above split" })
  map("n", "<C-l>", function()
    sp.move_cursor_right()
  end, { desc = "Move to right split" })
end

-- Hop
map("n", "<leader>sw", ":HopWord<CR>", { noremap = true, silent = true })
map("n", "<leader>sc", ":HopChar1<CR>", { noremap = true, silent = true })
map("n", "<leader>sl", ":HopLine<CR>", { noremap = true, silent = true })

-- Navigate buffers
if utils.is_available "bufferline.nvim" then
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
  -- map("n", "}", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer tab right" })
  -- map("n", "{", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer tab left" })
  map("n", "<leader>oc", "<cmd>BufferLineCloseRight<cr> | <cmd>BufferLineCloseLeft<cr>", { desc = "Close other tabs" })
else
  map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
  map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
end

-- Fast commands
map("n", "<leader>a", "<cmd>qa!<CR>")

-- Terminal
if utils.is_available "nvim-toggleterm.lua" then
  map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
end

-- Standard Operations
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quite" })

-- Move lines
map("n", "<A-k>", "<cmd>m .-2<CR>==", silent)
map("n", "<A-j>", "<cmd>m .+1<CR>==", silent)
map("i", "<A-k>", "<cmd>m .-2==gi<CR>", silent)
map("i", "<A-j>", "<cmd>m .+1==gi<CR>", silent)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", silent)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", silent)

if utils.is_available "vim-bbye" then
  map("n", "<leader>c", "<cmd>Bdelete!<CR>", { desc = "Delete buffer" })
end

-- LSP
map("n", "<leader>lf", vim.lsp.buf.formatting_sync, { desc = "Format code" })
map("n", "<leader>ll", vim.lsp.buf.implementation, { desc = "LSP code action" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename current symbol" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover symbol details" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current symbol" })
-- map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration of current symbol" })
-- map("n", "gr", vim.lsp.buf.references, { desc = "References of current symbol" })
map("n", "{", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "}", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- GitSigns
if utils.is_available "gitsigns.nvim" then
  map("n", "<leader>gj", function()
    require("gitsigns").next_hunk()
  end, { desc = "Next git hunk" })
  map("n", "<leader>gk", function()
    require("gitsigns").prev_hunk()
  end, { desc = "Previous git hunk" })
  map("n", "<leader>gl", function()
    require("gitsigns").blame_line()
  end, { desc = "View git blame" })
  map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
  end, { desc = "Preview git hunk" })
  map("n", "<leader>gh", function()
    require("gitsigns").reset_hunk()
  end, { desc = "Reset git hunk" })
  map("n", "<leader>gr", function()
    require("gitsigns").reset_buffer()
  end, { desc = "Reset git buffer" })
  map("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
  end, { desc = "Stage git hunk" })
  map("n", "<leader>gu", function()
    require("gitsigns").undo_stage_hunk()
  end, { desc = "Unstage git hunk" })
  map("n", "<leader>gd", function()
    require("gitsigns").diffthis()
  end, { desc = "View git diff" })
end

-- Telescope
if utils.is_available "telescope.nvim" then
  map("n", "<leader>gt", function()
    require("telescope.builtin").git_status()
  end, { desc = "Telescope git status" })
  map("n", "<leader>gb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Telescope git branchs" })
  map("n", "<leader>gc", function()
    require("telescope.builtin").git_commits()
  end, { desc = "Telescope git commits" })
  map("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
  end, { desc = "Telescope search buffers" })
end

-- Comment
if utils.is_available "Comment.nvim" then
  map("n", "<leader>/", function()
    require("Comment.api").toggle_current_linewise()
  end, { desc = "Toggle comment line" })
end

-- SymbolsOutline
if utils.is_available "symbols-outline.nvim" then
  map("n", "<leader>lS", "<cmd>SymbolsOutline<CR>", { desc = "Symbols outline" })
end

-- Visual --
-- Stay in indent mode
map("v", "<S-Tab>", "<gv", { desc = "unindent line" })
map("v", "<Tab>", ">gv", { desc = "indent line" })

-- Comment
if utils.is_available "Comment.nvim" then
  map(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
    { desc = "Toggle comment line" }
  )
end

-- disable Ex mode:
map("n", "Q", "<Nop>")

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

return M
