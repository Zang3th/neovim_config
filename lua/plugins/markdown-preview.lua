return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function()
        local keymaps = require("keymaps")
        keymaps.markdown_preview_keymaps()

        vim.fn["mkdp#util#install"]()
    end,
}
