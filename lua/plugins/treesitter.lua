return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
        "bash",
        "regex",
				"typescript",
				"javascript",
				"tsx",
				"python",
				"html",
				"php",
				"ninja",
				"rst",
				"css",
				"json",
        "markdown",
        "markdown_inline",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
