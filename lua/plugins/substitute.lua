return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("substitute").setup()
        local keymap = require("keymaps")
        keymap.sub_keymaps()
    end,
}
