return {
    "gbprod/substitute.nvim",
    lazy = false,
    config = function()
        require("substitute").setup()
        require("keymaps").substitute_keymaps()
    end,
}
