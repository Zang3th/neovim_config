return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        { "mfussenegger/nvim-dap" },
        { "nvim-neotest/nvim-nio" },
    },
    config = function()
        require("dapui").setup({
            icons = {
                expanded = "󰅀",
                collapsed = "󰅂",
                current_frame = "󰅂",
            },
            layouts = {
                {
                    elements = { "scopes", "console" },
                    position = "bottom",
                    size = 20,
                },
                {
                    elements = { "stacks", "breakpoints", "expressions" },
                    position = "right",
                    size = 50,
                },
            },
            expand_lines = false,
            controls = {
                enabled = false,
            },
            floating = {
                border = "rounded",
            },
            render = {
                indent = 4,
                max_type_length = 0,
            },
        })
    end
}
