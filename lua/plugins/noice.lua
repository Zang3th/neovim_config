return {
    "folke/noice.nvim",
    lazy = false,
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("noice").setup({
            ---@diagnostic disable-next-line: undefined-field
            require("notify").setup({
                timeout = 5000,
                stages = "slide",
                render = "compact",
                max_width = 60,
                minimum_width = 60,
                fps = 144,
                background_color = "#000000",
            }),
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
        })
    end,
}
