-- Map leader to space
vim.g.mapleader = " "
-- File Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines with j k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor don't move when appending lines
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping cursor stays middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Seach term stay in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without copy to Clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to System Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without copy to Clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Ctrl-c to Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- No press cap Q
vim.keymap.set("n", "Q", "<nop>")
-- Tmux change sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Format File
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Vim quick fix cycle throw errors
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word where cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make bash script executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--Edit Lazy File
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/mark/lazy.lua<CR>");

-- UndoTree
vim.keymap.set('n', '<leader>u', ":UndoTreeShow<CR>")
