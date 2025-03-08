return {
  {
    "zk-org/zk-nvim",
    event = "VeryLazy",
    config = function()
      require("zk").setup()
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
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      -- suggested keymap
      { "<leader>np", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
