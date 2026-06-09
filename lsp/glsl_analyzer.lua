return {
    cmd = { "glsl_analyzer" },
    filetypes = { "glsl" },
    root_markers = { ".git" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
