return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                -- TODO: Add linting and formatting for cpp
            },
        })

        local keymaps = require("keymaps")
        keymaps.none_ls_keymaps()
    end,
}
