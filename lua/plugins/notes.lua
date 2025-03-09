return {
  {
    "zk-org/zk-nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>nn",
        "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = 'Ideas' }<cr>",
        desc = "Create new notes",
      },
      {
        "<leader>nj",
        "<cmd>ZkNew { group = 'daily', dir = 'Journal' }<cr>",
        desc = "Create new Journal",
      },
      {
        "<leader>nl",
        "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'learn', dir = 'Learn' }<cr>",
        desc = "Create new Learning notes",
      },
      {
        "<leader>ns",
        "<cmd>ZkNew { group = 'standup', dir = 'StandUp' }<cr>",
        desc = "Create new Stand up",
      },
      {
        "<leader>nf",
        "<cmd>ZkNotes<cr>",
        desc = "Search notes",
      },
      {
        "<leader>nt",
        "<cmd>ZkTags<cr>",
        desc = "Search notes by tag",
      },
      {
        "<leader>ng",
        "<cmd>ZkLinks<cr>",
        desc = "Search notes by links",
      },
      {
        "<leader>nG",
        "<cmd>ZkBacklinks<cr>",
        desc = "Search notes by back links",
      },
    },
    config = function()
      require("zk").setup({
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "AndrewRadev/switch.vim",
    event = "VeryLazy",
    keys = {
      { "<leader>s", "<cmd>Switch<cr>", desc = "Power of switch magic on code" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      -- suggested keymap
      { "<leader>np", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  -- {
  --   "3rd/image.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("image").setup({
  --       backend = "kitty",
  --       processor = "magick_rock", -- or "magick_cli"
  --       integrations = {
  --         markdown = {
  --           enabled = true,
  --           clear_in_insert_mode = true,
  --           download_remote_images = false,
  --           only_render_image_at_cursor = true,
  --           floating_windows = false, -- if true, images will be rendered in floating markdown windows
  --           filetypes = { "markdown" }, -- markdown extensions (ie. quarto) can go here
  --         },
  --       },
  --       window_overlap_clear_enabled = false,                                           -- toggles images when windows are overlapped
  --       editor_only_render_when_focused = true,                                         -- auto show/hide images when the editor gains/looses focus
  --       hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  --     })
  --   end,
  -- },
  -- {
  --   "3rd/diagram.nvim",
  --   event = "VeryLazy",
  --   branch = "feature/toggle",
  --   dependencies = {
  --     "3rd/image.nvim",
  --   },
  --   opts = { -- you can just pass {}, defaults below
  --     renderer_options = {
  --       mermaid = {
  --         theme = "forest",
  --       },
  --       plantuml = {
  --         charset = "utf-8",
  --       },
  --       d2 = {
  --         theme_id = 1,
  --       },
  --       gnuplot = {
  --         theme = "dark",
  --         size = "800,600",
  --       },
  --     },
  --   },
  --   config = function()
  --     local api = require("diagram")
  --     vim.keymap.set({ "n", "v" }, "<leader>nd", function()
  --       api.toggle()
  --     end, {desc = "Toggle image display"})
  --
  --   end,
  -- },
}
