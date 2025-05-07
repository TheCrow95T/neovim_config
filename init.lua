-- Setting up imports
require("options")
require("keybindings")

 -- -- put this in your main init.lua file ( before lazy setup )
 -- vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

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

-- -- (method 2, for non lazyloaders) to load all highlights at once
--  for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
--    dofile(vim.g.base46_cache .. v)
--  end
