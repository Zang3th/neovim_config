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
                    "markdownlint",
                    "stylua",
                    "prettier",
                    "clang-format",
                    "codelldb",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    -- "clangd",
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
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                filetypes = { "c", "cpp", "objc", "objcpp" },
                cmd = {
                    "clangd-17",
                    "--clang-tidy",
                    "-j=20",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--header-insertion-decorators",
                    "--log=verbose",
                },
            })
            lspconfig.cmake.setup({
                capabilities = capabilities,
            })
            lspconfig.autotools_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.glsl_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.texlab.setup({
                capabilities = capabilities,
            })
            lspconfig.marksman.setup({
                capabilities = capabilities,
            })

            local keymaps = require("keymaps")
            keymaps.lsp_keymaps()
        end,
    },
}
