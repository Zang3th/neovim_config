return {
	"numToStr/Comment.nvim",
	opts = {},
	lazy = false,
	config = function()
		require("Comment").setup({
			sticky = true,
			toggler = {
				line = "<leader>cc",
				block = "<leader>bc",
			},
			opleader = {
				line = "<leader>cc",
				block = "<leader>bc",
			},
		})
	end,
}
