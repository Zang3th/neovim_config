return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VimEnter",
    opts = {
        signs = false,
    },
    config = function()
        require("todo-comments").setup()
    end,
}
