-- Set keys for horizontal and vertical splitting
vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

-- Set key to to toggle neotree
vim.api.nvim_set_keymap('n', '<C-b>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Keybindings for neogit
vim.api.nvim_set_keymap('n', '<leader>g', ':Neogit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', ':DiffviewOpen<CR>', { noremap = true, silent = true })

local M = {}

-- Keybindings for telescope
function M.telescope_keymaps()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-f>', builtin.find_files, {})
    vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
end

-- Keybindings for LSP
function M.lsp_keymaps()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
end

-- Keybinding for none-ls
function M.none_ls_keymaps()
    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})
end

-- Function for setting diffview keymaps
function SetDiffviewKeymaps()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-q>', ':DiffviewClose<CR>', opts)
end

-- Auto command for setting diffview keymaps
vim.cmd [[
    augroup DiffviewKeymaps
        autocmd!
        autocmd FileType DiffviewFiles lua SetDiffviewKeymaps()
    augroup END
]]

-- Function for disabling default keymaps in neo-tree
function DisableNeoTreeKeymaps()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, 'n', 'j', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'k', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'ö', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'h', '<Nop>', opts)
end

-- Auto commmand for disabling default keymaps in neo-tree
vim.cmd [[
    augroup DisableNeoTreeKeymaps
        autocmd!
        autocmd FileType neo-tree lua DisableNeoTreeKeymaps()
    augroup END
]]

return M;
