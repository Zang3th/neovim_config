return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox_dark",
                globalstatus = false,
                refresh = {
                    statusline = 100,
                },
            },
            extensions = { "lazy", "mason", "trouble" },
            tabline = {
                lualine_a = {
                    {
                        "tabs",
                        tab_max_length = 30,
                        max_length = function()
                            return vim.o.columns
                        end,
                        mode = 1,
                        path = 0,
                        use_mode_colors = true,
                    }
                },
            },
            winbar = {},
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "diff" },
                lualine_x = { "diagnostics" },
                lualine_y = { "encoding" },
                lualine_z = { "location" },
            },
        })
    end,
}
