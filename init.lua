-- Setting up configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "

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

-- Install plugins
local plugins = {
    {   
        "EdenEast/nightfox.nvim" 
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Initiate colorscheme
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,     -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,    -- Non focused panes set to alternative background
    module_default = true,   -- Default enable value for modules
    styles = {               -- Style to be applied to different syntax groups
      comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = true,
      search = true,
    },
  },
})

-- setup must be called before loading
vim.cmd("colorscheme carbonfox")

-- telescope setup and keybinding
local builtin = require('telescope.builtin')

-- Treesitter
local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "lua", "typescript", "javascript", "html", "php", "css" },
    highlight = { enable = true },
    indent = { enable = true },  
})


-- General keybinding
vim.keymap.set('n', '<C-s>', ':wa<CR>', {})
-- Telescope keybinding
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- Neotree keybinding
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', {})
vim.keymap.set('n', '<leader>E', ':Neotree close<CR>', {})
