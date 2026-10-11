return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        local install_dir = vim.fn.stdpath("data") .. "/site"
        vim.opt.runtimepath:prepend(install_dir)
        ts.setup({ install_dir = install_dir })

        local languages = {
            "bash",
            "c",
            "cmake",
            "cpp",
            "css",
            "glsl",
            "html",
            "hyprlang",
            "javascript",
            "jsdoc",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "vim",
            "vimdoc",
            "yaml",
        }
        ts.install(languages)

        -- Collect the filetypes that map to the installed languages (e.g. bash -> sh)
        local filetypes = {}
        for _, lang in ipairs(languages) do
            vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(lang))
        end

        -- Attach Tree-sitter on every FileType event
        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function(args)
                local buf = args.buf
                -- Map filetype to Tree-sitter language
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then return end
                -- Start Tree-sitter highlighter, parser may still be installing
                if not pcall(vim.treesitter.start, buf, lang) then return end
                -- If "indents" exist use Tree-sitter based indentation
                if vim.treesitter.query.get(lang, "indents") ~= nil then
                    vim.bo[buf].indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()"
                else
                    -- Fallback: restore default indenting
                    vim.bo[buf].indentexpr = ""
                end
            end,
        })
    end,
}
