return {
	{
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({
                replace_netrw = true,
                ui = {
                    height = 0.9,
                    width = 0.9,
                    border = "single"
                },
            })
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
        config = function ()
            require("image").setup({
                -- backend = "ueberzug",
                window_overlap_clear_enabled = true,
                tmux_show_only_in_active_window = true,
            })
        end
	},
	{
		"nvim-lualine/lualine.nvim",
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
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
			})

			-- Open parent directory in floating window
			vim.keymap.set("n", "<C-o>", require("oil").toggle_float)
		end,
	},
	{
		"ojroques/nvim-bufdel",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
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
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
}
