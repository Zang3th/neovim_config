return {
    "ellisonleao/gruvbox.nvim",
    priority = 999,
    opts = ...,
    config = function()
        vim.o.background = "dark"
        vim.cmd([[colorscheme gruvbox]])
    end
}
