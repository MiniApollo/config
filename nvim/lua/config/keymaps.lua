-- Document existing key chains
local wk = require("which-key")
wk.add({
	{ "<leader>s", group = "Search" },
	{ "<leader>t", group = "Toggle" },
	{ "<leader>d", group = "Buffers" },
	{ "<leader>m", group = "Harpoon" },
})

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })

-- Buffers
vim.keymap.set("n", "<leader>dp", vim.cmd.bprevious, { desc = "Buffer previus" })
vim.keymap.set("n", "<leader>dn", vim.cmd.bnext, { desc = "Buffer next" })
vim.keymap.set("n", "<leader>dk", vim.cmd.bd, { desc = "Buffer close" })
vim.keymap.set("n", "<leader>dj", vim.cmd.Ex, { desc = "Explore" })

vim.keymap.set("n", "<leader>dl", vim.cmd.Lazy, { desc = "Lazy" })
vim.keymap.set("n", "<leader>dm", vim.cmd.Mason, { desc = "Mason" })

vim.keymap.set("n", "<leader>sc", function()
	vim.cmd("edit " .. vim.fn.stdpath("config"))
end, { desc = "Open Config Directory" })

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

-- Telescope
-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Cycle through options in snippet
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- Toggle spell checking on and off
vim.keymap.set("n", "<leader>ts", function()
	vim.opt.spell = not (vim.opt.spell:get())
	if vim.opt.spell:get() then
		print("Spell check: ON")
	else
		print("Spell check: OFF")
	end
end, { desc = "[T]oggle [S]pell" })
