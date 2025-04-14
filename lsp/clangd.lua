return {
    cmd = {
        "clangd",
        "--clang-tidy",
        "-j=20",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--log=verbose",
    },
    filetypes = { "c", "cpp" },
    root_markers = { "compile_commands.json", "CMakeLists.txt", ".git" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
