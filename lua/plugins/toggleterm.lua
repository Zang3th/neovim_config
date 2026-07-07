return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            direction = "vertical",
            size = 100,
            persist_size = false,
        })

        local opts = { noremap = true, silent = true }
        vim.keymap.set({ "n", "t" }, "<leader>t1", "<cmd>1ToggleTerm<CR>", opts)
        vim.keymap.set({ "n", "t" }, "<leader>t2", "<cmd>2ToggleTerm<CR>", opts)
    end,
}
