return {
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        version = "*",
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        version = "*",
        config = function()
            require("mini.pairs").setup()
        end,
    },
    {
        "echasnovski/mini.move",
        event = "VeryLazy",
        version = "*",
        config = function()
            require("mini.move").setup()
        end,
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        version = "*",
        keys = function(_, keys)
            -- Populate the keys based on the user's options
            local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
            local opts = require("lazy.core.plugin").values(plugin, "opts", false)
            local mappings = {
                { opts.mappings.add,            desc = "Add Surrounding",                     mode = { "n", "v" } },
                { opts.mappings.delete,         desc = "Delete Surrounding" },
                { opts.mappings.find,           desc = "Find Right Surrounding" },
                { opts.mappings.find_left,      desc = "Find Left Surrounding" },
                { opts.mappings.highlight,      desc = "Highlight Surrounding" },
                { opts.mappings.replace,        desc = "Replace Surrounding" },
                { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
            }
            mappings = vim.tbl_filter(function(m)
                return m[1] and #m[1] > 0
            end, mappings)
            return vim.list_extend(mappings, keys)
        end,
        opts = {
            mappings = {
                add = "gsa", -- Add surrounding in Normal and Visual modes
                delete = "gsd", -- Delete surrounding
                find = "gsf", -- Find surrounding (to the right)
                find_left = "gsF", -- Find surrounding (to the left)
                highlight = "gsh", -- Highlight surrounding
                replace = "gsr", -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
    },
    {
        "echasnovski/mini.cursorword",
        event = "VeryLazy",
        version = "*",
        config = function()
            require("mini.cursorword").setup()
            vim.cmd("hi MiniCursorword gui=underline")
        end,
    },
}
