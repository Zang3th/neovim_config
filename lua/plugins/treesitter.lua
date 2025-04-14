return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        ---@diagnostic disable: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "css",
                "glsl",
                "html",
                "hyprlang",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "vim",
                "vimdoc",
                "yaml",
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
