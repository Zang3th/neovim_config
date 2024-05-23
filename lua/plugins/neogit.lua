return {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        require("diffview").setup()
        local configs = require("neogit")
        configs.setup({
            integrations = {
                telescope = true,
                diffview = true
            }
        })
    end
}
