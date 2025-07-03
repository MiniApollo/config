-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })

-- Buffers
vim.keymap.set("n", "<leader>dn", vim.cmd.bnext, { desc = "Buffer next" })
vim.keymap.set("n", "<leader>dp", vim.cmd.bprevious, { desc = "Buffer previus" })
vim.keymap.set("n", "<leader>dk", vim.cmd.bd, { desc = "Buffer close" })
vim.keymap.set("n", "<leader>dj", vim.cmd.Ex, { desc = "Explore" })

-- Move lines with JK
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor don't move when J
vim.keymap.set("n", "J", "mzJ`z")

-- Jumping keep cursor center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search keep cursor center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Launch Tmux sessionizer in vim
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww sessionizer-tmux<CR>")
