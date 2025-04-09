return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    config = function()
        require("substitute").setup()
        require("keymaps").substitute_keymaps()
    end,
}
