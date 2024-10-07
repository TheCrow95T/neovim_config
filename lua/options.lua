local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.ignorecase = true -- search case insensitive
opt.smartcase = true -- search matters if capital letter
opt.undofile = true -- save undo history
opt.mouse = "a"

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
-- vim.o.foldenable = true

vim.g.mapleader = " "
