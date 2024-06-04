-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- copy selection to real clipboard
keymap.set("v", "<leader>y", "\"*y", { desc = "Copy to real(system) clipboard" })
-- paste from system clipboard
keymap.set("v", "<leader>p", "\"*p", { desc = "Paste from real(system) clipboard in visual mode" })
keymap.set("n", "<leader>p", "\"*p", { desc = "Paste from real(system) clipboard in normal mode" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Unindent without leaving indent mode" })
keymap.set("v", ">", ">gv", { desc = "Indent without leaving indent mode" })

keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
