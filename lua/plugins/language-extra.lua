return {
	{
		"adalessa/laravel.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"nvimtools/none-ls.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		config = true,
	},
	{
		"mfussenegger/nvim-jdtls",
		event = "VeryLazy",
	},
}
