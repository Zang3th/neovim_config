return {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
    init_options = {
        provideFormatter = true,
    },
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
