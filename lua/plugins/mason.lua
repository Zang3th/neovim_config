return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- Lua
                    "lua-language-server",

                    -- Markdown
                    "marksman",

                    -- C/C++
                    "clangd",
                    "clang-format",

                    -- Python
                    "pyright",

                    -- Other
                    "glsl_analyzer",
                },
                run_on_start = true,
                auto_update = true,
            })
        end,
    },
}
