return {
	"folke/trouble.nvim",
    branch = "dev",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
    config = function()
        require("trouble").setup()
        local keymap = require("keymaps")
        keymap.trouble_keymaps()
    end
}
