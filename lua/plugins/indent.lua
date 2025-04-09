return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        indent = { char = "▏" },
    },
}
