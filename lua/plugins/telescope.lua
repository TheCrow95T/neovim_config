return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
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
      require("telescope").load_extension("media_files")
      require("telescope").load_extension("harpoon")

      -- keybindings
      local keymap = vim.keymap.set

      keymap("n", "<leader><leader>", builtin.find_files, { desc = "Find file from current directory" })
      keymap("n", "<leader>/", builtin.live_grep, { desc = "Find text from current directory" })
      keymap("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
      keymap("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODO from current directory" })
      keymap("n", "<leader>fp", ":Telescope project<CR>", { desc = "Find Project" })
      keymap("n", "<leader>fi", ":Telescope media_files<CR>", { desc = "Find media files" })
      keymap("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find Keymapping" })
      keymap("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "Find Mark" })
      keymap("n", "<leader>fn", ":Telescope noice<CR>", { desc = "Find Noice message" })
      keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
      keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", { desc = "Find buffers" })
    end,
  },
}
