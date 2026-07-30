return {
    cmd = {
        "marksman",
    },
    filetypes = { "markdown" },

    root_dir = function(bufnr, on_dir)
        local name = vim.api.nvim_buf_get_name(bufnr)

        -- Virtual diffview buffer shouldn't start the LSP
        if name:match("^diffview://") then
            return
        end

        local root = vim.fs.root(name, ".git")
        if root then
            on_dir(root)
        end
    end,

    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
