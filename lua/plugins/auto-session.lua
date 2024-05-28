local function restore_nvim_tree()
	local nvim_tree = require("nvim-tree")
	nvim_tree.change_dir(vim.fn.getcwd())
end

return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_session_use_git_branch = false,
			auto_session_enable_last_session = false,
			pre_save_cmds = { "NvimTreeClose" },
			post_restore_cmds = { restore_nvim_tree, "NvimTreeOpen" },
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
		local keymaps = require("keymaps")
		keymaps.auto_session_keymaps()
	end,
}
