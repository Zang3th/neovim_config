return {
    "ellisonleao/gruvbox.nvim",
    priority = 999,
    opts = ...,
    config = function()
        vim.o.background = "dark" -- or "light" for light mode       
        vim.cmd([[colorscheme gruvbox]])
    end
}
