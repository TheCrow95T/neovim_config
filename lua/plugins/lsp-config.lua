return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"jsonls",
					"tsgo",
					"phpactor",
					"basedpyright",
					"ruff",
					"html",
					"cssls",
					"tailwindcss",
					"eslint",
					"sqlls",
					"emmet_language_server",
					"terraformls",
					"tflint",
          "roslyn",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				"lua_ls",
				"jsonls",
				"tsgo",
				"phpactor",
				"basedpyright",
				"ruff",
				"html",
				"cssls",
				"tailwindcss",
				"eslint",
				"sqlls",
				"emmet_language_server",
				"terraformls",
				"tflint",
        "roslyn",
			}

			vim.lsp.config("*", {
				flags = {
					-- Debounce settings can improve performance
					debounce_text_changes = 50,
				},
				capabilities = capabilities,
			})
			vim.lsp.config("roslyn", {
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			})

			vim.lsp.config("emmet_language_server", {
				flags = {
					-- Debounce settings can improve performance
					debounce_text_changes = 50,
				},
				filetypes = { "css", "html", "javascriptreact", "typescriptreact" },
				-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
				-- **Note:** only the options listed in the table are supported.
				init_options = {
					---@type table<string, string>
					includeLanguages = {},
					--- @type string[]
					excludeLanguages = {},
					--- @type string[]
					extensionsPath = {},
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
					preferences = {},
					--- @type boolean Defaults to `true`
					showAbbreviationSuggestions = true,
					--- @type "always" | "never" Defaults to `"always"`
					showExpandedAbbreviation = "always",
					--- @type boolean Defaults to `false`
					showSuggestionsAsSnippets = false,
					--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
					syntaxProfiles = {},
					--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
					variables = {},
				},
			})

			vim.lsp.enable(servers)
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cs = { "csharpier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			{ "jbyuki/one-small-step-for-vimkind" },
			{ "nvim-neotest/nvim-nio" },
			{ "igorlfs/nvim-dap-view" },
      { "NicholasMata/nvim-dap-cs" },
		},
		config = function()
			local dap = require("dap")
      require('dap-cs').setup()

			-- Keymaps for controlling the debugger
			vim.keymap.set("n", "dq", function()
				dap.terminate()
				dap.clear_breakpoints()
			end, { desc = "Terminate and clear breakpoints" })

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
			vim.keymap.set("n", "<leader>du", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<F7>", dap.run_to_cursor, { desc = "Run to cursor" })
			-- vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
			-- vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
			-- vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })
			vim.keymap.set("n", "<F8>", dap.terminate, { desc = "Terminate debugging" })
			vim.keymap.set("n", "<F6>", "<cmd>DapViewToggle<cr>", { desc = "Toggle DAP view" })

			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "DapBreakpoint", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "󰳟", texthl = "", linehl = "DapStopped", numhl = "" })
		end,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		event = "VeryLazy",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
