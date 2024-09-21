local function restore_nvim_tree()
    local nvim_tree = require("nvim-tree")
    nvim_tree.change_dir(vim.fn.getcwd())
end

return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            auto_restore_last_session = false,
            continue_restore_on_error = false,
            log_level = "error",
            post_restore_cmds = { restore_nvim_tree, "NvimTreeOpen" },
            pre_save_cmds = { "NvimTreeClose" },
            session_lens = {
                buftypes_to_ignore = {},
                load_on_setup = true,
                previewer = false,
                theme_conf = {
                    border = true
                },
            },
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            use_git_branch = false,
        })
        local keymaps = require("keymaps")
        keymaps.auto_session_keymaps()
    end,
}
