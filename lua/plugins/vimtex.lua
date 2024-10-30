return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_general_viewer = "okular"
        vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
        vim.g.vimtex_mapping_enabled = 0
        local keymap = require("keymaps")
        keymap.vimtex_keymaps()
    end,
}
