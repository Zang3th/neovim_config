return {
    "brianhuster/live-preview.nvim",
    cmd = { "LivePreview" },
    init = function()
        require("keymaps").live_preview_keymaps()
    end,
}
