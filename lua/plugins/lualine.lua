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
                    statusline = 100,
                },
                always_divide_middle = true,
            },
            extensions = { "nvim-tree", "lazy", "mason", "trouble" },
            tabline = {
                lualine_a = {
                    {
                        "buffers",
                        symbols = {
                            modified = " ",
                            alternate_file = "",
                            directory = "",
                        },
                    },
                },
            },
            winbar = {},
            sections = {
                lualine_a = {
                    {
                        "mode",
                    },
                },
                lualine_b = { "branch" },
                lualine_c = { "diff" },
                lualine_x = { "encoding", "fileformat" },
                lualine_y = { "filetype" },
                lualine_z = {
                    {
                        "location",
                    },
                },
            },
            inactive_sections = {
                lualine_x = {},
            },
        })
    end,
}
