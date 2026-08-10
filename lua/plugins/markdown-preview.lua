return
{
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_port = "8080"
    end,
    config = function()
        require("keymaps").markdown_preview_keymaps()
    end,
    ft = { "markdown" },
}
