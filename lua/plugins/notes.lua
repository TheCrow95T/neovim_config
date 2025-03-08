return {
	{
		"zk-org/zk-nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>nn", "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = 'Ideas' }<cr>", desc = "Create new notes" },
			{ "<leader>nj", "<cmd>ZkNew { group = 'daily', dir = 'Journal' }<cr>", desc = "Create new Journal" },
			{ "<leader>nl", "<cmd>ZkNew { group = 'learn', dir = 'Learn' }<cr>", desc = "Create new Learning notes" },
			{ "<leader>ns", "<cmd>ZkNew { group = 'standup', dir = 'StandUp' }<cr>", desc = "Create new Stand up" },
      { "<leader>nf", "<cmd>ZkNotes<cr>", desc = "Search notes" },
			{ "<leader>nt", "<cmd>ZkTags<cr>", desc = "Search notes by tag" },
		},
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
