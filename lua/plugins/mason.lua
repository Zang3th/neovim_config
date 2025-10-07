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
                    "luacheck",

                    -- Markdown
                    "marksman",
                    "markdownlint",

                    -- C/C++
                    "clangd",
                    "clang-format",
                    "cmake-language-server",

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
