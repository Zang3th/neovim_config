return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        require("diffview").setup({
            default_args = {
                DiffviewOpen = { "--untracked-files=all" },
            },
            view = {
                default = {
                    layout = "diff2_horizontal",
                },
            },
            keymaps = {
                view = {
                    ["q"] = "<Cmd>DiffviewClose<CR>",
                    ["<C-q>"] = "<Cmd>DiffviewClose<CR>",
                },
                file_panel = {
                    ["q"] = "<Cmd>DiffviewClose<CR>",
                    ["<C-q>"] = "<Cmd>DiffviewClose<CR>",
                },
            },
        })
        require("keymaps").diffview_keymaps()
    end,
}
