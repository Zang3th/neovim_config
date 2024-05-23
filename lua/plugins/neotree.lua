return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local configs = require("neo-tree")
        configs.setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false
                }
            },
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "*",
                    highlight = "NeoTreeFileIcon",
                },
                name = {
                    trailing_slash = true,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "",
                        -- Status type
                        untracked = "★",
                        ignored   = "◌",
                        unstaged  = "✗",
                        staged    = "✓",
                        conflict  = "",
                    }
                },
                window = {
                    position = "left",
                    width = 40,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    }
                }
            }
        })
        vim.cmd [[
            highlight NeoTreeGitAdded guifg=#b8bb26
            highlight NeoTreeGitModified guifg=#fe8019
            highlight NeoTreeGitDeleted guifg=#cc241d
            highlight NeoTreeGitRenamed guifg=#a89984
            highlight NeoTreeGitUntracked guifg=#b8bb26
        ]]
    end
}
