return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local helpers = require("null-ls.helpers")

        -- Custom markdownlint definition
        local markdownlint = {
            method = null_ls.methods.DIAGNOSTICS,
            filetypes = { "markdown" },
            generator = null_ls.generator({
                command = "markdownlint",
                args = { "--stdin", "--disable", "MD013" },
                to_stdin = true,
                from_stderr = true,
                format = "line",
                check_exit_code = function(code, stderr)
                    local success = code <= 1

                    if not success then
                        print(stderr)
                    end

                    return success
                end,
                on_output = helpers.diagnostics.from_patterns({
                    {
                        pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
                        groups = { "row", "col", "message" },
                    },
                    {
                        pattern = [[:(%d+) [%w-/]+ (.*)]],
                        groups = { "row", "message" },
                    },
                }),
            }),
        }

        -- Register markdownlint
        null_ls.register(markdownlint)

        -- Setup null-ls with additional sources
        null_ls.setup({
            debug = true,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.clang_format,
            },
        })

        -- Load custom keymaps
        local keymaps = require("keymaps")
        keymaps.none_ls_keymaps()
    end,
}
