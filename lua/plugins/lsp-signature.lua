return {
    "ray-x/lsp_signature.nvim",
    lazy = false,
    opts = {
        bind = true,

        -- UI
        floating_window = true,
        floating_window_above_cur_line = true,
        fix_pos = true,
        max_height = 12,
        max_width = 80,
        wrap = false,
        handler_opts = {
            border = "rounded",
        },

        -- No hints, no documentation
        hint_enable = false,
        doc_lines = 0,

        extra_trigger_chars = { "(", "," },
    },
}
