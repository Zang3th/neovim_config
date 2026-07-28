return {
    "nvim-mini/mini.nvim",
    version = false,
    lazy = false,
    dependencies = { "ellisonleao/gruvbox.nvim" },

    config = function()
        require("mini.trailspace").setup()

        local files = require("mini.files")
        local git_cache = {}
        local is_windows = vim.fn.has("win32") == 1

        local function normalize(path)
            path = vim.fs.normalize(path)
            return is_windows and path:lower() or path
        end

        -- Cache one porcelain status table per repository.
        local function read_git(path, force)
            local root = vim.fs.root(path, ".git")
            if not root then
                return nil
            end

            local root_key = normalize(root)
            if not force and git_cache[root_key] then
                return git_cache[root_key]
            end

            local result = vim.system({
                "git",
                "--no-optional-locks",
                "status",
                "--porcelain=v1",
                "-z",
                "--untracked-files=all",
            }, {
                cwd = root,
                text = false,
            }):wait(2000)

            local statuses = {}
            git_cache[root_key] = statuses

            if result.code ~= 0 or type(result.stdout) ~= "string" then
                return statuses
            end

            local records = vim.split(result.stdout, "\0", {
                plain = true,
                trimempty = true,
            })

            local index = 1
            while index <= #records do
                local record = records[index]
                local status = record:sub(1, 2)
                local relative_path = record:sub(4)

                if #status == 2 and relative_path ~= "" then
                    local absolute_path = vim.fs.joinpath(root, relative_path)
                    statuses[normalize(absolute_path)] = status
                end

                -- In porcelain v1 -z, renames/copies are followed by the old path.
                if status:find("[RC]") then
                    index = index + 1
                end

                index = index + 1
            end

            return statuses
        end

        local function prefix(entry)
            if entry.fs_type == "directory" then
                return files.default_prefix(entry)
            end

            local statuses = read_git(entry.path, false)
            local status = statuses and statuses[normalize(entry.path)]

            local buffer = vim.fn.bufnr(entry.path)
            if buffer ~= -1
                and vim.api.nvim_buf_is_loaded(buffer)
                and vim.bo[buffer].modified
            then
                return " ", "MiniFilesBufferModified"
            end

            if not status then
                return files.default_prefix(entry)
            end

            if status == "??" then
                return "★ ", "MiniFilesGitNew"
            end

            if status:find("U", 1, true) or status == "AA" or status == "DD" then
                return " ", "MiniFilesGitConflict"
            end

            if status:find("D", 1, true) then
                return " ", "MiniFilesGitDeleted"
            end

            if status:find("R", 1, true) or status:find("C", 1, true) then
                return "➜ ", "MiniFilesGitRenamed"
            end

            if status:sub(1, 1) ~= " " then
                return "✓ ", "MiniFilesGitStaged"
            end

            return " ", "MiniFilesGitModified"
        end

        files.setup({
            content = {
                prefix = prefix,
            },
            options = {
                permanent_delete = false,
                use_as_default_explorer = true,
                lsp_timeout = 1000,
            },
            windows = {
                max_number = 4,
                preview = true,
                width_focus = 50,
                width_nofocus = 50,
                width_preview = 50,
            },
        })

        local group = vim.api.nvim_create_augroup("MiniFilesConfig", {
            clear = true,
        })

        local function refresh_git()
            git_cache = {}

            -- Passing content.prefix forces all visible entries to be redrawn.
            files.refresh({
                content = {
                    prefix = prefix,
                },
            })
        end

        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "MiniFilesExplorerOpen",
            callback = function()
                refresh_git()

                files.set_bookmark("c", vim.fn.stdpath("config"), {
                    desc = "Neovim config",
                })

                files.set_bookmark("w", vim.fn.getcwd, {
                    desc = "Working directory",
                })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "MiniFilesBufferCreate",
            callback = function(args)
                local buffer = args.data.buf_id

                vim.keymap.set("n", "<Esc>", files.close, {
                    buffer = buffer,
                    desc = "Close mini.files",
                })

                vim.keymap.set("n", "<CR>", function()
                    files.go_in({ close_on_file = true })
                end, {
                    buffer = buffer,
                    desc = "Open entry",
                })

                vim.keymap.set("n", "<C-r>", function()
                    -- synchronize() also picks up external file-system changes.
                    files.synchronize()
                    refresh_git()
                end, {
                    buffer = buffer,
                    desc = "Refresh files and Git",
                })

                -- Requires a terminal that distinguishes Ctrl+Enter from Enter.
                vim.keymap.set("n", "<C-CR>", function()
                    local entry = files.get_fs_entry()
                    if entry then
                        vim.ui.open(entry.path)
                    end
                end, {
                    buffer = buffer,
                    desc = "Open with system application",
                })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = {
                "MiniFilesActionCreate",
                "MiniFilesActionDelete",
                "MiniFilesActionRename",
                "MiniFilesActionCopy",
                "MiniFilesActionMove",
            },
            callback = function()
                git_cache = {}
            end,
        })

        vim.api.nvim_create_autocmd("BufModifiedSet", {
            group = group,
            callback = function(args)
                if not files.get_explorer_state() then
                    return
                end

                if vim.bo[args.buf].filetype == "minifiles" then
                    return
                end

                files.refresh({
                    content = {
                        prefix = prefix,
                    },
                })
            end,
        })

        vim.api.nvim_create_autocmd("BufWritePost", {
            group = group,
            callback = function()
                if files.get_explorer_state() then
                    refresh_git()
                end
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            group = group,
            pattern = "MiniFilesWindowOpen",
            callback = function(args)
                local win = args.data.win_id
                vim.wo[win].cursorline = true
                vim.wo[win].signcolumn = "no"

                local config = vim.api.nvim_win_get_config(win)
                config.border = "rounded"
                config.title_pos = "center"
                vim.api.nvim_win_set_config(win, config)
            end,
        })

        local function apply_highlights()
            local colors = require("gruvbox").palette
            local highlights = {
                MiniFilesNormal = {
                    bg = colors.dark0,
                    fg = colors.light1,
                },
                MiniFilesBorder = {
                    bg = colors.dark0,
                    fg = colors.dark2,
                },
                MiniFilesBorderModified = {
                    bg = colors.dark0,
                    fg = colors.bright_yellow,
                },
                MiniFilesCursorLine = {
                    bg = colors.dark1,
                },
                MiniFilesDirectory = {
                    fg = colors.bright_blue,
                    bold = true,
                },
                MiniFilesFile = {
                    fg = colors.light1,
                },
                MiniFilesTitle = {
                    bg = colors.dark0,
                    fg = colors.gray,
                },
                MiniFilesTitleFocused = {
                    bg = colors.dark0,
                    fg = colors.bright_blue,
                    bold = true,
                },
                MiniFilesGitModified = {
                    fg = colors.bright_orange,
                },
                MiniFilesGitStaged = {
                    fg = colors.bright_green,
                },
                MiniFilesGitNew = {
                    fg = colors.bright_green,
                },
                MiniFilesBufferModified = {
                    fg = colors.bright_yellow,
                },
                MiniFilesGitDeleted = {
                    fg = colors.bright_red,
                },
                MiniFilesGitRenamed = {
                    fg = colors.bright_blue,
                },
                MiniFilesGitConflict = {
                    fg = colors.bright_purple,
                },
            }

            for name, value in pairs(highlights) do
                vim.api.nvim_set_hl(0, name, value)
            end
        end

        apply_highlights()

        vim.api.nvim_create_autocmd("ColorScheme", {
            group = group,
            pattern = "gruvbox",
            callback = apply_highlights,
        })
    end,
}
