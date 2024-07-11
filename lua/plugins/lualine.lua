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
            },
            extensions = { "nvim-tree", "lazy", "mason", "trouble" },
            tabline = {},
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
