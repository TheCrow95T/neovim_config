local keymap = vim.keymap.set

-- General keybinding
vim.cmd('vnoremap c "_c')
keymap("n", "<C-s>", ":wa<CR>", { desc = "Save all files" })
keymap("n", "<C-m>", ":delm! | delm A-Z0-9<CR>", { desc = "Clear Mark" })
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
keymap("n", "<leader>rs", ":lua require('persistence').load()<CR>", { desc = "Resume session" })

-- File Browser keybinding
keymap("n", "<leader>e", "<cmd>lua Snacks.explorer()<CR>", { desc = "Toggle Snacks Explorer" })
keymap("n", "<C-e>", "<cmd>Yazi toggle<CR>", { desc = "Toggle Yazi Explorer" })

-- Bufferline keybindings
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
keymap("n", "<leader><S-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move to previous buffer" })
keymap("n", "<leader><S-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move to next buffer" })
keymap("n", "<C-w>", "<cmd>lua Snacks.bufdelete()<CR>", { desc = "Delete current buffer" })
vim.cmd("unmap <C-w>d")
vim.cmd("unmap <C-w><C-d>")

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

-- Lazy.nvim keybings
keymap("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy package manager" })

-- Lazygit keybindings
keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
keymap("n", "<leader>K", "<cmd>Gitsigns blame_line<CR>", { desc = "gitsign blame line" })

-- lsp keymapping
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap("n", "<space>lr", "<cmd>LspRestart<cr>", { desc = "LSP restart" })
keymap("n", "<space>cr", vim.lsp.buf.rename, { desc = "LSP rename" })
keymap("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Formatter" })

-- Noice dismiss message
keymap("n", "<leader>dn", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss noice notification" })

-- Trouble keymapping
keymap("n", "<leader>cd", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble diagnostics" })

-- Open Terminal
keymap("n", "<C-t>", "<cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Open Snacks Term" })
keymap("t", "<C-t>", "<C-\\><C-n><cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Close Snacks Term" })

-- Quickfix persist keymap
keymap("n", "<leader>qs", ":lua require('persist-quickfix').save('list-name')", { desc = "Save quickfix list" })
keymap("n", "<leader>qc", ":lua require('persist-quickfix').choose()", { desc = "Choose quickfix list" })

-- To prevent item that are replaced with paste doesn't goes into buffer
-- local function map(m, k, v)
--     vim.keymap.set(m, k, v, { silent = true })
-- end
--
-- map("x", "p", "P")
