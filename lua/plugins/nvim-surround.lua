return {
    "kylechui/nvim-surround",
    version = "*",
    lazy = false,
    config = function()
        require("nvim-surround").setup()
    end,
}
