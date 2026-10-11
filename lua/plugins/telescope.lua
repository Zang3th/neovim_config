return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "folke/todo-comments.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        lazy = false,
        config = function()
            local keymaps = require("keymaps")
            keymaps.telescope_keymaps()

            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {},
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob", "*.cpp",
                        "--glob", "*.cxx",
                        "--glob", "*.cc",
                        "--glob", "*.c",
                        "--glob", "*.hpp",
                        "--glob", "*.hxx",
                        "--glob", "*.hh",
                        "--glob", "*.h",
                        "--glob", "*.inl",
                        "--glob", "CMakeLists.txt",
                        "--glob", "*.cmake",
                        "--glob", "*.lua",
                        "--glob", "*.vim",
                        "--glob", "*.sh",
                        "--glob", "*.md",
                        "--glob", "*.tex",
                        "--glob", "*.bib",
                        "--glob", "*.sty",
                        "--glob", "*.cls",
                        "--glob", "*.json",
                        "--glob", "*.yaml",
                        "--glob", "*.yml",
                        "--glob", "*.py",
                        "--glob", "*.html",
                        "--glob", "*.css",
                        "--glob", "*.scss",
                        "--glob", "*.less",
                        "--glob", "*.js",
                        "--glob", "*.mjs",
                        "--glob", "*.cjs",
                        "--glob", "*.jsx",
                        "--glob", "*.ts",
                        "--glob", "*.tsx",
                        "--glob", "*.glsl",
                        "--glob", "*.vert",
                        "--glob", "*.frag",
                        "--glob", "*.geom",
                        "--glob", "*.comp",
                        "--glob", "*.tesc",
                        "--glob", "*.tese",
                        "--glob", "!.git/*",
                        "--glob", "!Build/*",
                        "--glob", "!out/*",
                        "--trim",
                    },
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close,
                            ["<C-q>"] = actions.close,
                        },
                        n = {
                            ["<Esc>"] = actions.close,
                            ["<C-q>"] = actions.close,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/", "--glob", "!Build/*", "--glob", "!out/*" },
                    },
                },
            })
            require('telescope').load_extension('fzf')
            require("telescope").load_extension("ui-select")
        end,
    },
}
