-- General keybinding  TODO: add description to all key bindings and implement key binding search function
vim.keymap.set("n", "<C-s>", ":wa<CR>", {})

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Telescope keybindings
-- Please go to plugins directory

-- Treesitter keybindings
vim.keymap.set("n", "<leader>i", "gg<S-v>G=", {})

-- Neotree keybinding
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", {})

-- Bufferline keybindings
vim.keymap.set("n", "<S-h>", ":bprev<CR>", {})
vim.keymap.set("n", "<S-l>", ":bnext<CR>", {})
vim.keymap.set("n", "<C-w>", ":BufDel<CR>", {})

-- Lazy.nvim keybings
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>", {})

-- Lazygit keybindings
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", {})

-- Persistence keybindings
vim.keymap.set("n", "<leader>ps", [[<cmd>lua require("persistence").load()<cr>]], {})

-- nvim-lspconfig keymapping
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {})

-- none-ls keymapping
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- autocompletion keymapping
-- see autocompletion.lua

-- tmux keymapping
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Go to the previous pane" })
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Got to the left pane" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Got to the down pane" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Got to the up pane" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Got to the right pane" })

