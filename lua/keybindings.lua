local keymap = vim.keymap.set

-- General keybinding
vim.cmd('vnoremap c "_c')
keymap("n", "<C-s>", ":wa<CR>", { desc = "Save all files" })
keymap("n", "<C-m>", ":delm! | delm A-Z0-9<CR>", { desc = "Clear Mark" })
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
keymap("n", "<leader>s", ":lua require('persistence').load()<CR>", { desc = "Resume session" })

-- Neotree keybinding
keymap("n", "<leader><C-e>", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
vim.api.nvim_set_keymap("n", "<C-e>", "", {
    noremap = true,
    callback = function()
        require("ranger-nvim").open(true)
    end,
})

-- Bufferline keybindings
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
keymap("n", "<leader><S-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move to previous buffer" })
keymap("n", "<leader><S-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move to next buffer" })
keymap("n", "<C-w>", "<cmd>BufDel<CR>", { desc = "Delete current buffer" })
vim.cmd("unmap <C-w>d")
vim.cmd("unmap <C-w><C-d>")

-- Move to window using the <ctrl> hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Split windows
keymap("n", "<leader>\\", "<cmd>vs<cr>", { desc = "Vertical split" })
keymap("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })

-- Toggle focus windows
keymap("n", "<M-z>", "<cmd>lua require('maximizer').toggle()<cr>", { desc = "Toggle Focus window" })

-- tmux keymapping
keymap("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Go to the previous pane" })
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Got to the left pane" })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Got to the down pane" })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Got to the up pane" })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Got to the right pane" })

-- Telescope keybindings
-- Please go to plugins directory

-- autocompletion keymapping
-- see autocompletion.lua

-- Lazy.nvim keybings
keymap("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy package manager" })

-- Lazygit keybindings
keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- nvim-lspconfig keymapping
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- laravel keymapping
keymap("n", "<leader>pa", "<cmd>Laravel artisan<cr>", { desc = "Laravel artisan" })
keymap("n", "<leader>pr", "<cmd>Laravel routes<cr>", { desc = "Laravel routes" })
keymap("n", "<leader>pm", "<cmd>Laravel related<cr>", { desc = "Laravel related" })

-- none-ls code formatter
keymap("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Formatter" })

-- Noice dismiss message
keymap("n", "<leader>nn", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss noice notification" })

-- Trouble keymapping
keymap("n", "<leader>cd", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble diagnostics" })

-- Open ToggleTerm
keymap("n", "<C-t>", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "Open ToggleTerm" })
keymap("t", "<C-t>", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>", { desc = "Close ToggleTerm" })
