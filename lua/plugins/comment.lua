return {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
    config = function()
        require("Comment").setup({
            sticky = true,
        })
        require("keymaps").comment_keymaps()
    end,
}
