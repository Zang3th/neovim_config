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
                lualine_b = { "filename" },
                lualine_c = { {require('auto-session.lib').current_session_name} },
            },
            inactive_sections = {
                lualine_x = {},
            },
            tabline = {
                lualine_a = { "hostname" },
                lualine_b = { "branch" },
                lualine_c = { "diagnostics" },
            },
        })
    end,
}
