-- Setting up imports
require("options")
require("keybindings")

-- Setup lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", { defaults = { lazy = true } })

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

vim.cmd("augroup BladeFiltypeRelated\r\nau BufNewFile,BufRead *.blade.php set ft=blade\r\naugroup END")

-- LIST OF TODO
-- TODO: research and add test function to neovim
-- TODO: Study nvim-lspconfig keymapping
-- TODO: Write a README.md for future reference
