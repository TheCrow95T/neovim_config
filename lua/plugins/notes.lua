return {
	{
		"zk-org/zk-nvim",
		event = "VeryLazy",
		config = function()
			require("zk").setup({
				picker = "telescope",
				lsp = {
					config = {
						cmd = { "zk", "lsp" },
						name = "zk",
					},
					auto_attach = {
						enabled = true,
						filetypes = { "markdown" },
					},
				},
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
  {
    "AndrewRadev/switch.vim",
		event = "VeryLazy",
		keys = {
			{ "<leader>s", "<cmd>Switch<cr>", desc = "Power of switch magic on code" },
		},
  },
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			-- suggested keymap
			{ "<leader>np", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
