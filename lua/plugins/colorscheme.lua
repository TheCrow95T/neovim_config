return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function(PluginSpec, opts)
            require("nightfox").setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    transparent = false, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    module_default = true, -- Default enable value for modules
                    inverse = {         -- Inverse highlight for different types
                        match_paren = false,
                        visual = true,
                        search = false,
                    },
                },
                palettes = {
                    carbonfox = {
                        bg1 = "#1a1a1a", -- less black background
                    },
                },
            })
            vim.cmd("colorscheme carbonfox")
        end,
    },
    {
        "sainnhe/sonokai",
        event = "VeryLazy",
        config = function()
            vim.g.sonokai_style = "shusia"
            -- vim.g.sonokai_transparent_background = 1
            vim.g.sonokai_transparent_background = 0
            vim.g.sonokai_diagnostic_virtual_text = "colored"
            -- vim.cmd("colorscheme sonokai")
        end,
    },
}
