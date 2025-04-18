return {
	{
		"EdenEast/nightfox.nvim",
		event = "VeryLazy",
		priority = 1000,
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
			-- vim.cmd("colorscheme carbonfox")
		end,
	},
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_style = "shusia"
			-- vim.g.sonokai_transparent_background = 1
			vim.g.sonokai_transparent_background = 0
			vim.g.sonokai_diagnostic_virtual_text = "colored"
			-- vim.cmd("colorscheme sonokai")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
			})
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		event = "VeryLazy",
		config = function()
			require("vscode").setup({
				style = "light",
			})
			-- vim.cmd("colorscheme vscode")
		end,
	},
}
