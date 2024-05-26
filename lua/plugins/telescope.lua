return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.7",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
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
						"--glob",
						"!.git/",
					},
					mappings = {
						i = {
							["<Esc>"] = actions.close,
						},
						n = {
							["<Esc>"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!.git/" },
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
