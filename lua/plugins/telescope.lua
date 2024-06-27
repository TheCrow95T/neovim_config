return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
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
                defaults = {
                    preview = {
                        mime_hook = function(filepath, bufnr, opts)
                            local is_image = function(filepath)
                                local image_extensions = { "png", "jpg" } -- Supported image formats
                                local split_path = vim.split(filepath:lower(), ".", { plain = true })
                                local extension = split_path[#split_path]
                                return vim.tbl_contains(image_extensions, extension)
                            end
                            if is_image(filepath) then
                                local term = vim.api.nvim_open_term(bufnr, {})
                                local function send_output(_, data, _)
                                    for _, d in ipairs(data) do
                                        vim.api.nvim_chan_send(term, d .. "\r\n")
                                    end
                                end
                                vim.fn.jobstart({
                                    "chafa",
                                    filepath, -- Terminal image viewer command
                                }, { on_stdout = send_output, stdout_buffered = true, pty = true })
                            else
                                require("telescope.previewers.utils").set_preview_message(
                                    bufnr,
                                    opts.winid,
                                    "Binary cannot be previewed"
                                )
                            end
                        end,
                    },
                },
            })

            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("project")

            -- keybindings
            vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find file from current directory" })
            vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Find text from current directory" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
            vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODO from current directory" })
            vim.keymap.set("n", "<leader>fp", ":Telescope project<CR>", { desc = "Find Project" })
            vim.keymap.set("n", "<leader>fi", ":Telescope media_files<CR>", { desc = "Find media files" })
            vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find Keymapping" })
            vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>", { desc = "Find Mark" })
            vim.keymap.set("n", "<leader>fn", ":Telescope noice<CR>", { desc = "Find Noice message" })
            vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
            vim.keymap.set("n", "<leader>fc", ":Telescope colorscheme<CR>", { desc = "Find buffers" })
        end,
    },
}
