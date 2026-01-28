return { -- Plugins that not require much configuration
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"NMAC427/guess-indent.nvim",
		opts = {},
	},
	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"https://github.com/mbbill/undotree",
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"j-morano/buffer_manager.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
