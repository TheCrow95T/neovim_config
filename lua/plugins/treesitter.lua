return {
	{
		"romus204/tree-sitter-manager.nvim",
		event = "VeryLazy",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			local parsers = {
				"lua",
				"bash",
				"regex",
				"ecma",
				"jsx",
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
				"c_sharp",
			}
			require("tree-sitter-manager").setup({
				-- Default Options
				ensure_installed = parsers, -- list of parsers to install at the start of a neovim session
				border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
				auto_install = true, -- if enabled, install missing parsers when editing a new file
				highlight = parsers, -- treesitter highlighting is enabled by default
				nohighlight = {},
				languages = {}, -- override or add new parser sources
				parser_dir = vim.fn.stdpath("data") .. "/site/parser",
				query_dir = vim.fn.stdpath("data") .. "/site/queries",
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
