return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "stevearc/overseer.nvim", config = true },
        { "rcarriga/nvim-dap-ui" },
    },
    config = function()
        local keymap = require("keymaps")
        keymap.dap_keymaps()

        -- Signs
        for _, group in pairs({
            "DapBreakpoint",
            "DapBreakpointCondition",
            "DapBreakpointRejected",
            "DapLogPoint",
        }) do
            vim.fn.sign_define(group, { text = "●", texthl = group })
        end

        local dap = require("dap")

        -- Decides when and how to jump when stopping at a breakpoint, the order matters!
        -- (1) If the line with the breakpoint is visible, don't jump at all
        -- (2) If the buffer is opened in a tab, jump to it instead
        -- (3) Else, create a new tab with the buffer
        dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"

        -- C, C++, Rust
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                command = "codelldb",
                args = { "--port", "${port}" },
            },
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = false,
            },
        }
    end
}
