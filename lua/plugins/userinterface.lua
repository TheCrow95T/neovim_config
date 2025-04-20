return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      indent = {},
      explorer = {},
      styles = {
        snacks_image = {
          relative = "editor",
          col = -1,
        },
      },
      image = {
        enabled = true,
        doc = {
          inline = false,
          float = true,
          max_width =  60,
          max_height =  30,
        },
      },
      terminal = {
        win = {
          style = "float",
          width = math.floor(vim.o.columns * 0.8),
          height = math.floor(vim.o.lines * 0.8),
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },
        sections = {
          lualine_c = {
            {
              "filename",
              file_status = true, -- Displays file status (readonly status, modified status)
              newfile_status = false, -- Display new file status (new file means no write after created)
              path = 1,        -- 0: Just the filename
              shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              symbols = {
                modified = "[+]", -- Text to show when the file is modified.
                readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                unnamed = "[No Name]", -- Text to show for unnamed buffers.
                newfile = "[New]", -- Text to show for newly created file before first write
              },
            },
          },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    version = "*",
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup({
        options = {
          show_buffer_close_icons = false,
          show_close_icon = false,
          diagnostics = "nvim_lsp",
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      require("outline").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = false,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {},  -- merged with defaults from documentation
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },
  {
    "stevearc/quicker.nvim",
    event = "VeryLazy",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "brunobmello25/persist-quickfix.nvim",
    event = "VeryLazy",
    --- @type PersistQuickfix.Config
    opts = {},
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      local neoscroll = require("neoscroll")
      local keymap = {
        ["<C-u>"] = function()
          neoscroll.ctrl_u({ duration = 50 })
        end,
        ["<C-d>"] = function()
          neoscroll.ctrl_d({ duration = 50 })
        end,
      }
      local modes = "n"
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end,
  },
}
