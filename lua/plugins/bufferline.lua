return {
    'akinsho/bufferline.nvim', 
    version = "*",
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{}
    end
}
