return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 999,
    opts = ...,
    config = function()
        local gruvbox = require("gruvbox")
        local colors = gruvbox.palette
        gruvbox.setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = false,
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
                ["@markup.strong"]          = { fg = colors.bright_blue, bold = true },
                ["@markup.italic"]          = { fg = colors.bright_purple, italic = true },
                ["@markup.strikethrough"]   = { fg = colors.bright_green },
                ["@markup.heading"]         = { fg = colors.bright_yellow, bold = true },
                ["@markup.quote"]           = { fg = colors.bright_aqua, italic = true },
                ["@markup.link.label"]      = { fg = colors.bright_red },

                ["@lsp.type.macro.cpp"]     = { fg = colors.neutral_purple, bold = true },
                ["@keyword.import.cpp"]     = { fg = colors.bright_red, bold = true },
                ["@keyword.directive.cpp"]  = { fg = colors.bright_red, bold = true },
                ["@lsp.type.namespace.cpp"] = { fg = colors.bright_blue },
                ["@lsp.type.class.cpp"]     = { fg = colors.bright_aqua },
                ["@lsp.type.struct.cpp"]    = { fg = colors.bright_aqua },
            },
            dim_inactive = false,
            transparent_mode = false,
        })
        vim.cmd([[colorscheme gruvbox]])
    end,
}
