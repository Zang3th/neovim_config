return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            hijack_cursor = true,
            auto_reload_on_write = true,
            update_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = { "help" },
            },
            view = {
                cursorline = true,
                preserve_window_proportions = true,
                width = 35,
                signcolumn = "no",
            },
            renderer = {
                add_trailing = true,
                highlight_git = "all",
                icons = {
                    web_devicons = {
                        file = {
                            enable = true,
                            color = true,
                        },
                        folder = {
                            enable = false,
                            color = true,
                        },
                    },
                    git_placement = "after",
                    modified_placement = "after",
                    padding = " ",
                    show = {
                        folder_arrow = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "󰆤",
                        modified = "",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "󰷏",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            git = {
                show_on_dirs = false,
                show_on_open_dirs = false,
                ignore = false,
            },
            modified = {
                enable = true,
                show_on_dirs = false,
                show_on_open_dirs = false,
            },
        })
        vim.cmd([[
            highlight NvimTreeFolderName guifg=#83a598
            highlight NvimTreeGitDirty guifg=#fe8019
            highlight NvimTreeGitNew guifg=#b8bb26
            highlight NvimTreeGitDeleted guifg=#fb4934
            highlight NvimTreeGitRenamed guifg=#83a598
        ]])
    end,
}
