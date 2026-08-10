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
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    dependencies = {
      -- "nvim-orgmode/org-bullets.nvim",
      -- "lukas-reineke/headlines.nvim",
      "danilshvalov/org-modern.nvim"
    },
    config = function()
      local Menu = require("org-modern.menu")
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        win_split_mode = 'edit',
        ui = {
          menu = {
            handler = function(data)
              Menu:new({
                window = {
                  margin = { 1, 0, 1, 0 },
                  padding = { 0, 1, 0, 1 },
                  title_pos = "center",
                  border = "single",
                  zindex = 1000,
                },
                icons = {
                  separator = "➜",
                },
              }):open(data)
            end,
          },
        },
      })

      -- Experimental LSP support
      vim.lsp.enable('org')
    end,
  },
  {
    "AndrewRadev/switch.vim",
    event = "VeryLazy",
    keys = {
      { "<leader>s", "<cmd>Switch<cr>", desc = "Power of switch magic on code" },
    },
  },
}
