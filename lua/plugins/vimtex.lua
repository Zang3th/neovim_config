return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_general_viewer = "okular"
        vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
        vim.g.vimtex_mapping_enabled = 0

        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk_engines = {
            ['_'] = '-xelatex', -- Default
            pdflatex = '-pdf',
            lualatex = '-lualatex',
            xelatex = '-xelatex',
        }

        local keymap = require("keymaps")
        keymap.vimtex_keymaps()
    end,
}
