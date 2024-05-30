return {
	"ellisonleao/gruvbox.nvim",
	priority = 999,
	opts = ...,
	config = function()
		require("gruvbox").setup({
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				["@text.emphasis"] = { fg = "#83a598" },
                ["@macro"] = { fg = "#fb4934" },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd([[colorscheme gruvbox]])
	end,
}
