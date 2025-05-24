return {
	{
		"seblyng/roslyn.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
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
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("easy-dotnet").setup({
				picker = "snacks",
			})

			-- keybindings
			local keymap = vim.keymap.set

			keymap("n", "<leader>dc", "<cmd>Dotnet<CR>", { desc = "Dotnet command" })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = {
			"typescript",
			"typescriptreact",
			"javascript",
			"javascriptreact",
		},
		config = function(_, opts)
			local api = require("typescript-tools.api")
			opts.handlers = {
				["textDocument/publishDiagnostics"] = api.filter_diagnostics({
					80001, -- Ignore this might be converted to a ES export
				}),
			}
			require("typescript-tools").setup(opts)
		end,
		opts = {
			expose_as_code_action = "all",
			complete_function_calls = false,
			jsx_close_tag = {
				enable = true,
				filetypes = { "javascriptreact", "typescriptreact" },
			},
		},
	},
	{
		url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    enabled = true,
		event = "VeryLazy",
		ft = { "javascript", "typescript" },
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("sonarlint").setup({
				server = {
					cmd = {
						"sonarlint-language-server",
						"-stdio",
						"-analyzers",
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
						vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
				settings = {
					sonarlint = {
						rules = {
							["typescript:S6019"] = { level = "on" },
							["typescript:S6035"] = { level = "on" },
							["typescript:S2933"] = { level = "on" },
							["typescript:S1607"] = { level = "on" },
							["typescript:S6079"] = { level = "on" },
						},
					},
				},
			})
		end,
	},
}
