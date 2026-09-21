return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        if vim.fn.has("win32") == 1 then
            local sumatra = vim.fn.exepath("SumatraPDF")
            if sumatra == "" and vim.env.LOCALAPPDATA then
                local candidate = vim.fs.joinpath(vim.env.LOCALAPPDATA, "SumatraPDF", "SumatraPDF.exe")
                if vim.fn.executable(candidate) == 1 then
                    sumatra = candidate
                end
            end

            if sumatra ~= "" then
                vim.g.vimtex_view_method = "general"
                vim.g.vimtex_view_general_viewer = sumatra
                vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
            end
        elseif vim.fn.executable("sioyek") == 1 then
            vim.g.vimtex_view_method = "sioyek"
        elseif vim.fn.executable("okular") == 1 then
            vim.g.vimtex_view_method = "general"
            vim.g.vimtex_view_general_viewer = "okular"
            vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
        end

        vim.g.vimtex_mapping_enabled = 0
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk_engines = {
            -- ['_'] = '-xelatex', -- Set to default if working on CV
            pdflatex = '-pdf',
            lualatex = '-lualatex',
            xelatex = '-xelatex',
        }
        vim.g.vimtex_compiler_latexmk = {
            build_dir = '',
            options = {
                '-shell-escape',
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode'
            }
        }
        require("keymaps").vimtex_keymaps()
    end,
}
