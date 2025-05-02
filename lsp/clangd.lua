return {
    cmd = {
        "clangd",
        "--clang-tidy",
        "-j=20",
        "--all-scopes-completion",
        "--function-arg-placeholders=0",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--header-insertion-decorators",
        "--log=error",
        "--pretty",
    },
    filetypes = { "c", "cpp" },
    root_markers = { "compile_commands.json", "CMakeLists.txt", ".git" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
