return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
            "TheCrow95T/telescope-media-files.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")

			local actions = require("telescope.actions")
			require("telescope").setup({
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<C-w>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("project")
            require('telescope').load_extension('media_files')

			-- keybindings
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find file from current directory" })
			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Find text from current directory" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
			vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODO from current directory" })
			vim.keymap.set("n", "<leader>fp", ":Telescope project<CR>", { desc = "Find Project" })
			vim.keymap.set("n", "<leader>fi", ":Telescope media_files<CR>", { desc = "Find media files" })
			vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find Keymapping" })
			vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>", { desc = "Find Mark" })
			vim.keymap.set("n", "<leader>fn", ":Telescope noice<CR>", { desc = "Find Noice message" })
			vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fc", ":Telescope colorscheme<CR>", { desc = "Find buffers" })
		end,
	},
}
