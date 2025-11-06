return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
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
                        -- "--hidden",
                        "--glob", "*.cpp",
                        "--glob", "*.hpp",
                        "--glob", "*.h",
                        "--glob", "!.git/*",
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
                        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/" },
                    },
                },
            })
            require('telescope').load_extension('fzf')
            require("telescope").load_extension("ui-select")
        end,
    },
}
