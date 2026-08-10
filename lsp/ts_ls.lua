return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    root_markers = {
        "jsconfig.json",
        "package.json",
        "package-lock.json",
        "yarn.lock",
        "pnpm-lock.yaml",
        "bun.lockb",
        "bun.lock",
        ".git",
    },
    init_options = {
        hostInfo = "neovim",
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
