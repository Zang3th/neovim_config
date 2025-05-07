return {
    "nvim-lualine/lualine.nvim",
    requires = {
        "nvim-tree/nvim-web-devicons",
        opt = true,
    },
    lazy = false,
    priority = 999,
    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox_dark",
                globalstatus = false,
                refresh = {
                    statusline = 100,
                },
            },
            extensions = { "nvim-tree", "lazy", "mason", "trouble" },
            tabline = {
                lualine_a = {
                    {
                        "tabs",
                        tab_max_length = 40,
                        max_length = vim.o.columns * 2 / 3,
                        mode = 1,
                        path = 0,
                        use_mode_colors = true,
                    }
                },
            },
            winbar = {},
            sections = {
                lualine_a = {
                    {
                        "mode",
                        mode = 2,
                        path = 1,
                    },
                },
                lualine_b = { "branch" },
                lualine_c = { "diff" },
                lualine_x = { "diagnostics" },
                lualine_y = { "encoding" },
                lualine_z = { "location" },
            },
        })
    end,
}
