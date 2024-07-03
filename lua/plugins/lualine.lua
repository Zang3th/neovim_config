return {
    "nvim-lualine/lualine.nvim",
    requires = {
        "nvim-tree/nvim-web-devicons",
        opt = true,
    },
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        require("lualine").setup({
            options = {
                theme = "gruvbox_dark",
                globalstatus = true,
                refresh = {
                    tabline = 100,
                    statusline = 100,
                },
                always_divide_middle = true,
            },
            extensions = { "nvim-tree", "lazy", "mason", "trouble" },
            tabline = {
                lualine_a = {
                    {
                        "filename",
                        file_status = true,
                        symbols = {
                            modified = " ",
                        },
                    },
                },
                lualine_z = {
                    {
                        "tabs",
                        tab_max_length = 40,
                        max_length = vim.o.columns / 2,
                        mode = 0,
                        show_modified_status = true,
                        symbols = {
                            modified = " ",
                        },
                    },
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
