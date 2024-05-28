return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("diffview").setup()
		local configs = require("neogit")
		configs.setup({
			integrations = {
				diffview = true,
			},
		})
	end,
}
