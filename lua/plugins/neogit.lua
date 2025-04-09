return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
        require("diffview").setup()
        require("neogit").setup({
            integrations = {
                diffview = true,
            },
        })
    end,
}
