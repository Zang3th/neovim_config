return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 999,
    opts = ...,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "",  -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                ["@markup.strong"]       = { fg = "#83a598", bold = true }, -- Markdown bold in Blue/bold
                ["@text.emphasis"]       = { fg = "#d3869b" },              -- Markdown italic in Purple
                ["@macro"]               = { fg = "#ebdbb2", bold = true }, -- C/C++ macro in FG/bold
                ["@lsp.type.class.cpp"]  = { fg = "#8ec07c" },              -- C++ class in Aqua
                ["@lsp.type.struct.cpp"] = { fg = "#8ec07c" },              -- C/C++ struct in Aqua
            },
            dim_inactive = false,
            transparent_mode = false,
        })
        vim.cmd([[colorscheme gruvbox]])
    end,
}
