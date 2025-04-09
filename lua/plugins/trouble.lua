return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        require("trouble").setup()
        require("keymaps").trouble_keymaps()
    end,
}
