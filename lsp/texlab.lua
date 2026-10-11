return {
    cmd = { "texlab" },
    filetypes = { "tex", "plaintex", "bib" },
    root_markers = { ".git", ".latexmkrc", "latexmkrc" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
