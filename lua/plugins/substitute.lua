return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymaps = require("keymaps")
		keymaps.substitution_keymaps()
		require("substitute").setup()
	end,
}
