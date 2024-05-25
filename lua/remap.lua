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

-- Set CNTRL + q for quitting windows
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

-- Set keys for switching between splits
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Stay in visual mode after indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Stay in visual block mode after indenting
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })
