return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    root_markers = { "package.json", ".git" },
    init_options = {
        provideFormatter = true,
        embeddedLanguages = {
            css = true,
            javascript = true,
        },
        configurationSection = { "html", "css", "javascript" },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
