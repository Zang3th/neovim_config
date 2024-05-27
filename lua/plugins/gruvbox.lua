return {
	"ellisonleao/gruvbox.nvim",
	priority = 999,
	opts = ...,
	config = function()
		vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox]])

		-- Custom highlight groups
		vim.cmd([[
            highlight @text.emphasis guifg=#83a598 gui=italic
        ]])
	end,
}
