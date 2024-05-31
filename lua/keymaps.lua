local opts = { noremap = true, silent = true }

-- Set keys for horizontal and vertical splitting
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>se", ":wincmd =<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>sx", ":close<CR>", opts)

-- Set key to to toggle nvimtree
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Keybindings for neogit
vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fd", ":DiffviewOpen<CR>", opts)

-- Open lazy
vim.api.nvim_set_keymap("n", "<leader>ll", ":Lazy<CR>", opts)

-- Buffer control
vim.api.nvim_set_keymap("n", "<leader>b<Right>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b<Left>", ":bprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bl", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bh", ":bprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-q>", ":bdelete<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bx", ":%bd|e#|bd#<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b1", ":LualineBuffersJump! 1<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b2", ":LualineBuffersJump! 2<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b3", ":LualineBuffersJump! 3<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b4", ":LualineBuffersJump! 4<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b5", ":LualineBuffersJump! 5<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b6", ":LualineBuffersJump! 6<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b7", ":LualineBuffersJump! 7<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b8", ":LualineBuffersJump! 8<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b9", ":LualineBuffersJump! 9<CR>", opts)

local M = {}

-- Keybinding for auto-session
function M.auto_session_keymaps()
    vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
        noremap = true,
    })
end

-- Keybindings for telescope
function M.telescope_keymaps()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "ff", builtin.find_files, {})
    vim.keymap.set("n", "fg", builtin.live_grep, {})
    vim.keymap.set("n", "fs", builtin.grep_string, {})
    vim.keymap.set("n", "ft", ":TodoTelescope<CR>", {})
end

-- Keybindings for LSP
function M.lsp_keymaps()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
end

-- Keybindings for substitution
function M.substitution_keymaps()
    local substitute = require("substitute")
    vim.keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
    vim.keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
end

-- Keybinding for none-ls
function M.none_ls_keymaps()
    vim.keymap.set("n", "<C-f><C-f>", vim.lsp.buf.format, {})
end

-- Keybindings for trouble
function M.trouble_keymaps()
    vim.api.nvim_set_keymap("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", {})
end

-- Keybinding for markdown-preview
function M.markdown_preview_keymaps()
    vim.api.nvim_set_keymap("n", "<C-m>", ":MarkdownPreviewToggle<CR>", {})
end

-- Function for setting diffview keymaps
function SetDiffviewKeymaps()
    vim.api.nvim_buf_set_keymap(0, "n", "<C-q>", ":DiffviewClose<CR>", opts)
end

-- Auto command for setting diffview keymaps
vim.cmd([[
    augroup DiffviewKeymaps
        autocmd!
        autocmd FileType DiffviewFiles lua SetDiffviewKeymaps()
    augroup END
]])

return M
