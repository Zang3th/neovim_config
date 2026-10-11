return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = false,
        on_attach = function(bufnr)
            require("keymaps").gitsigns_keymaps(bufnr)
        end,
    },
}
