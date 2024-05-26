return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
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
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				cmd = {
					capabilities = capabilities,
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
