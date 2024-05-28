return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("barbar").setup({
			clickable = false,
			icons = {
				button = "",
				filetype = {
					custom_colors = false,
					enabled = false,
				},
				separator = { left = "▎" },
				separator_at_end = false,
				modified = { button = "" },
			},
			sidebar_filetypes = {
				NvimTree = true,
			},
		})
		vim.cmd([[
            highlight BufferCurrent guifg=#ebdbb2 guibg=#282828
            highlight BufferCurrentSign guifg=#ebdbb2 guibg=#282828
            highlight BufferCurrentMod guifg=#fabd2f guibg=#282828
            highlight BufferCurrentModBtn guifg=#fabd2f guibg=#282828
            highlight BufferVisible guibg=#3c3836
            highlight BufferVisibleSign guifg=#504945 guibg=#3c3836
            highlight BufferVisibleMod guifg=#fabd2f guibg=#3c3836
            highlight BufferVisibleModBtn guifg=#fabd2f guibg=#3c3836
            highlight BufferInactive guibg=#3c3836
            highlight BufferInactiveSign guifg=#504945 guibg=#3c3836
            highlight BufferInactiveMod guifg=#fabd2f guibg=#3c3836
            highlight BufferInactiveModBtn guifg=#fabd2f guibg=#3c3836

        ]])
	end,
}
