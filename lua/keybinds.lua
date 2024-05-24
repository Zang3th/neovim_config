-- Set CNTRL + q
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

-- Set navigation keys from hjkl to jklö (10-Finger default position)
vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ö', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'ö', 'l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-j>', '<Left>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Down>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Up>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-ö>', '<Right>', { noremap = true, silent = true })

-- Set keys for horizontal and vertical splitting
vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

-- Set keys for switching between splits
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Set key to to toggle neotree
vim.api.nvim_set_keymap('n', '<C-b>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Function for disabling keymaps in neo-tree
function DisableNeoTreeKeymaps()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, 'n', 'j', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'k', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'ö', '<Nop>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'h', '<Nop>', opts)
end

-- Auto commmand for disabling keymaps in neo-tree
vim.cmd [[
    augroup DisableNeoTreeKeymaps
        autocmd!
        autocmd FileType neo-tree lua DisableNeoTreeKeymaps()
    augroup END
]]

-- Stay in visual mode after indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Stay in visual block mode after indenting
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })

-- Keybindings for neogit
vim.api.nvim_set_keymap('n', '<leader>g', ':Neogit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', ':DiffviewOpen<CR>', { noremap = true, silent = true })

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
