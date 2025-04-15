return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local helpers = require("null-ls.helpers")

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
                        vim.notify(stderr, vim.log.levels.WARN)
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

        local luacheck = {
            method = null_ls.methods.DIAGNOSTICS,
            filetypes = { "lua" },
            generator = null_ls.generator({
                command = "luacheck",
                args = { "--formatter", "plain", "--codes", "--ranges", "--filename", "$FILENAME", "-" },
                to_stdin = true,
                from_stderr = false,
                format = "line",
                check_exit_code = function(code)
                    return code <= 1
                end,
                on_output = helpers.diagnostics.from_patterns({
                    {
                        pattern = [[^stdin:(%d+):(%d+)-(%d+): %(([%w_]+)%) (.+)$]],
                        groups = { "row", "col", "end_col", "code", "message" },
                    },
                    {
                        pattern = [[^stdin:(%d+):(%d+): %(([%w_]+)%) (.+)$]],
                        groups = { "row", "col", "code", "message" },
                    },
                }),
            }),
        }

        null_ls.setup({
            debug = true,
            sources = {
                markdownlint,
                luacheck,
            },
        })
    end,
}
