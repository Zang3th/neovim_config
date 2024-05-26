return {
    "nvim-lualine/lualine.nvim",
    requires = {
        "nvim-tree/nvim-web-devicons",
        opt = true,
    },
    config = function()
        require("lualine").setup({
            options = { theme = "gruvbox_dark" },
            extensions = { "nvim-tree" },
            sections = {
                lualine_c = {},
            },
            inactive_sections = {
                lualine_x = {},
            },
            tabline = {
                lualine_a = { "hostname" },
                lualine_b = { "filename" },
                lualine_c = { "diagnostics" },
            },
        })
    end,
}
