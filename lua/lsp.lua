vim.lsp.config("texlab", {
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = { ".git", ".latexmkrc", "latexmkrc" },
})

vim.lsp.enable({
    "clangd",
    "cssls",
    "glsl_analyzer",
    "html",
    "lua_ls",
    "marksman",
    "pyright",
    "texlab",
    "ts_ls",
})
