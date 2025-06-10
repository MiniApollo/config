-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.set")
require("config.keymaps")
require("config.harpoon")

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
