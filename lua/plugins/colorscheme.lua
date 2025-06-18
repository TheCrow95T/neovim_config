return {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		config = function()
			-- vim.cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		event = "VeryLazy",
		config = function(PluginSpec, opts)
			require("nightfox").setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = false, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					inverse = { -- Inverse highlight for different types
						match_paren = false,
						visual = true,
						search = false,
					},
				},
				palettes = {
					carbonfox = {
						bg1 = "#1a1a1a", -- less black background
					},
				},
			})
			-- vim.cmd("colorscheme duskfox")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		name = "github-theme",
		config = function()
			require("github-theme").setup({
        specs = {
          github_dark_dimmed = {
            bg1 = "#2A272B",
          }
        },
				groups = {
					all = {
            Function = { fg = "#d299ff" },
						SnacksIndentScope = { fg = "#e86671" },
						SnacksIndent = { fg = "#4e505e" },
					},
				},
			})
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
	{
		"sainnhe/sonokai",
		event = "VeryLazy",
		config = function()
			vim.g.sonokai_style = "shusia"
			-- vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_transparent_background = 0
			vim.g.sonokai_diagnostic_virtual_text = "colored"
			-- vim.cmd("colorscheme sonokai")
		end,
	},
	{
		"navarasu/onedark.nvim",
		event = "VeryLazy",
		config = function()
			require("onedark").setup({
				style = "dark",
			})
		end,
	},
	{
		"yorik1984/newpaper.nvim",
		event = "VeryLazy",
		config = function()
			-- require("newpaper").setup({
			-- 	style = "dark",
			-- 	colors = {
			-- 		bg = "#292929",
			-- 	},
			-- })
			-- vim.cmd("colorscheme newpaper")
		end,
	},
	{
		"nickkadutskyi/jb.nvim",
		event = "VeryLazy",
	},
	{
		"Mofiqul/vscode.nvim",
		event = "VeryLazy",
		config = function()
			require("vscode").setup({
				style = "dark",
			})
		end,
	},
	{
		"catppuccin/nvim",
		event = "VeryLazy",
		name = "catppuccin",
	},
	{
		"morhetz/gruvbox",
		event = "VeryLazy",
	},
	{
		"cpea2506/one_monokai.nvim",
		event = "VeryLazy",
	},
	{
		"xiantang/darcula-dark.nvim",
		event = "VeryLazy",
	},
}
