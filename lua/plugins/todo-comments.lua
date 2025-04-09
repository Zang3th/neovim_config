return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
        signs = false,
    },
    config = function()
        require("todo-comments").setup({
            -- The default config is pretty complete already, just some little tweaks
            keywords = {
                TODO = { icon = " ", color = "info" },
                DONE = { icon = " ", color = "done" },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                FIX = {
                  icon = " ",
                  color = "error",
                  alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR", "ERR" },
                },
                HACK = { icon = " ", color = "warning" },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            colors = {
                done = { "#504945" },
            },
        })
    end,
}
