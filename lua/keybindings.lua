-- General keybinding
vim.keymap.set("n", "<C-s>", ":wa<CR>", {desc="Save all files"})
vim.keymap.set("n", "<C-m>", ":delm! | delm A-Z0-9<CR>", { desc = "Clear Mark" })

-- Neotree keybinding
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", {desc="Toggle NeoTree"})

-- Bufferline keybindings
vim.keymap.set("n", "<S-h>", ":bprev<CR>", {desc="Go to previous buffer"})
vim.keymap.set("n", "<S-l>", ":bnext<CR>", {desc="Go to next buffer"})
vim.keymap.set("n", "<C-w>", ":BufDel<CR>", {desc="Delete current buffer"})

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

-- Split windows
vim.keymap.set("n", "<leader>\\", "<cmd>vs<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal split" })

-- tmux keymapping
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Go to the previous pane" })
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Got to the left pane" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Got to the down pane" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Got to the up pane" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Got to the right pane" })

-- Telescope keybindings
-- Please go to plugins directory

-- autocompletion keymapping
-- see autocompletion.lua

-- Lazy.nvim keybings
vim.keymap.set("n", "<leader>ll", ":Lazy<CR>", {desc="Lazy package manager"})

-- Lazygit keybindings
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", {desc="LazyGit"})

-- nvim-lspconfig keymapping
vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc="Hover"})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc="Go to definition"})
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {desc="Code action"})

-- none-ls keymapping
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {desc="Code Formatter"})

