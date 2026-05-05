return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = false,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            vim.keymap.set("n", "gb", function()
              gs.blame_line({ full = true })
            end, { buffer = bufnr })
            vim.keymap.set("n", "gp", gs.preview_hunk, { buffer = bufnr })
        end,
    },
}
