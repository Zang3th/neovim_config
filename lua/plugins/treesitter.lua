return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            enable = true,
            disable = {
                "latex",
            },
            ignore_install = {
                "latex",
            },
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "cpp",
                "html",
                "glsl",
                "hyprlang",
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                disable = {
                    "latex",
                },
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            conceal = {
                enable = false,
            },
        })
    end,
}
