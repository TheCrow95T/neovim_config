return {
	{
		"pmizio/typescript-tools.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"seblyng/roslyn.nvim",
		event = "VeryLazy",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
	{
		"GustavEikaas/easy-dotnet.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("easy-dotnet").setup({
				picker = "snacks",
			})

			-- keybindings
			local keymap = vim.keymap.set

			keymap("n", "<leader>dc", "<cmd>Dotnet<CR>", { desc = "Dotnet command" })
		end,
	},
}
