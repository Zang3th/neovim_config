-- Set keys for horizontal and vertical splitting
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })

-- Set key to to toggle nvimtree
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Keybindings for neogit
vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fd", ":DiffviewOpen<CR>", { noremap = true, silent = true })

-- Open lazy
vim.api.nvim_set_keymap("n", "<C-l>", ":Lazy<CR>", { noremap = true, silent = true })

local M = {}

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
	vim.api.nvim_set_keymap("n", "<leader>xx", ":TroubleToggle<CR>", {})
	vim.api.nvim_set_keymap("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", {})
	vim.api.nvim_set_keymap("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", {})
end

-- Keybinding for markdown-preview
function M.markdown_preview_keymaps()
	vim.api.nvim_set_keymap("n", "<C-m>", ":MarkdownPreviewToggle<CR>", {})
end

-- Function for setting diffview keymaps
function SetDiffviewKeymaps()
	local opts = { noremap = true, silent = true }
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
