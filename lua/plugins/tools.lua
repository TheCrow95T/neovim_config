return {
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        config = function()
            require("nvim-highlight-colors").setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
}
