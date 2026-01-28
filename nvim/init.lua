-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.settings")
require("config.keymaps")
require("config.harpoon")

-- What I miss in Emacs, the responsivnes. Neovim is much more snappy.
