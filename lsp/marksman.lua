return {
    cmd = {
        "marksman",
    },
    filetypes = { "markdown" },
    root_markers = { ".git" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
