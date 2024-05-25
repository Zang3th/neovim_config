return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "cmake",
                    "autotools_ls",
                    "glsl_analyzer",
                    "texlab",
                    "marksman",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--clang-tidy",
                    "-j=12",
                    "--compile-commands-dir=Build_Debug",
                    "--query-driver=/usr/bin/clang++,/usr/bin/g++",
                    "--all-scopes-completion",
                    "--cross-file-rename",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--header-insertion-decorators",
                    "--fallback-style=llvm",
                    "--pch-storage=memory",
                    "--log=verbose",
                },
                filetypes = { "c", "cpp", "objc", "objcpp" },
            })
            lspconfig.cmake.setup({})
            lspconfig.autotools_ls.setup({})
            lspconfig.glsl_analyzer.setup({})
            lspconfig.texlab.setup({})
            lspconfig.marksman.setup({})

            local keymaps = require("keymaps")
            keymaps.lsp_keymaps()
        end,
    },
}
