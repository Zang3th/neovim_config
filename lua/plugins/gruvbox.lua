return { 
    "ellisonleao/gruvbox.nvim",
    priority = 999,
    config = true,
    opts = ...,
    config = function()
        vim.o.background = "dark" -- or "light" for light mode       
        vim.cmd([[colorscheme gruvbox]])
    end
}
