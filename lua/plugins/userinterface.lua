return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    -- theme = "material",
                    -- theme = "powerline",
                    theme = "auto",
                },
                sections = {
                    lualine_c = {
                        {
                            "buffers",
                            show_filename_only = true, -- Shows shortened relative path when set to false.
                            hide_filename_extension = false, -- Hide filename extension when set to true.
                            show_modified_status = false, -- Shows indicator when the buffer is modified.
                            mode = 2,
                            icons_enabled = false,

                            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                            filetype_names = {
                                TelescopePrompt = "Telescope",
                                dashboard = "Dashboard",
                                packer = "Packer",
                                fzf = "FZF",
                                alpha = "Alpha",
                                NvimTree = "NvimTree",
                            },
                            use_mode_colors = true,
                            buffers_color = {
                                inactive = "lualine_c_inactive", -- Color for active buffer.
                                active = "lualine_c_active", -- Color for inactive buffer.
                            },
                            symbols = {
                                alternate_file = "", --  to show to identify the alternate file
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "ojroques/nvim-bufdel",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                cmdline = {
                    view = "cmdline",
                },
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end,
    },
}
