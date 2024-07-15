return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                mode = "tabs",
                style_preset = {
                    bufferline.style_preset.no_italic,
                    -- bufferline.style_preset.no_bold,
                },
                themable = true,
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                modified_icon = "",
                offsets = {
                    {
                        filetype = "NvimTree",
                        -- text = "File Explorer",
                        -- text_align = "center",
                        -- separator = true,
                    },
                },
                color_icons = false,
                show_buffer_icons = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                -- separator_style = "any",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
            },
            highlights = {
                fill = {
                    -- fg = "#000000",
                    bg = "#3C3836", -- right part of the bar
                },
                background = {
                    fg = "#d5c4a1", -- text of bg tabs
                    bg = "#3c3836", -- bg tabs
                },
                separator = { -- separator between tabs
                    fg = "#282828",
                    bg = "#282828",
                },
                indicator_selected = { -- active tab indicator
                    fg = "#282828",
                    bg = "#282828",
                },
                modified = {
                    fg = "#fabd2f",
                    bg = "#3C3836",
                },
                modified_visible = {
                    fg = "#fabd2f",
                    bg = "#3C3836",
                },
                modified_selected = {
                    fg = "#fabd2f",
                    bg = "#282828",
                },
            },
        })
    end,
}
