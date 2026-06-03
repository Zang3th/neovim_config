return {
    "rmagatti/auto-session",
    lazy = false,

    dependencies = {
        "nvim-telescope/telescope.nvim",
    },

    opts = {
        auto_save = false,
        auto_restore = false,
        auto_create = false,

        session_lens = {
            picker = "telescope",

            mappings = {
                delete_session = { "i", "<C-d>" },
            },

            picker_opts = {
                border = true,
                layout_config = {
                    width = 0.8,
                    height = 0.5,
                },
            },

            load_on_setup = true,
        },
    },

    config = function(_, opts)
        require("auto-session").setup(opts)
        require("keymaps").auto_session_keymaps()
    end,
}
