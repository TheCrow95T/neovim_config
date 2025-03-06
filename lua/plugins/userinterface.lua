return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			image = {
        enabled = true
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			require("lualine").setup({
				options = {
					-- theme = "material",
					-- theme = "powerline",
					theme = "auto",
				},
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true, -- Displays file status (readonly status, modified status)
							newfile_status = false, -- Display new file status (new file means no write after created)
							path = 1, -- 0: Just the filename
							shorting_target = 40, -- Shortens path to leave 40 spaces in the window
							symbols = {
								modified = "[+]", -- Text to show when the file is modified.
								readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
								unnamed = "[No Name]", -- Text to show for unnamed buffers.
								newfile = "[New]", -- Text to show for newly created file before first write
							},
						},
					},
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		version = "*",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				options = {
					show_buffer_close_icons = false,
					show_close_icon = false,
					diagnostics = "nvim_lsp",
				},
			})
		end,
	},
	{
		"ojroques/nvim-bufdel",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},
  {
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      require("outline").setup({})
    end,
  },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
				},
			})
		end,
	},
	{
		"numToStr/FTerm.nvim",
		event = "VeryLazy",
		config = function()
			require("FTerm").setup({
				border = "double",
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})
		end,
	},
}
