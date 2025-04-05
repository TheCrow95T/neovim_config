return {
	{
		"mfussenegger/nvim-jdtls",
		event = "VeryLazy",
	},
  {
    "seblyng/roslyn.nvim",
  event = "VeryLazy",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        -- your configuration comes here; leave empty for default settings
    }
  }
}
