-- Set CTRL + q for quitting windows
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })

-- Set keys for switching between splits
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Stay in visual mode after indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Stay in visual block mode after indenting
vim.api.nvim_set_keymap("x", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", ">", ">gv", { noremap = true, silent = true })

-- Map 'ggVG' to CTRL + a
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Keybindings for popup menus
vim.api.nvim_set_keymap('c', '<Up>', 'pumvisible() ? "<C-p>" : "<Up>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('c', '<Down>', 'pumvisible() ? "<C-n>" : "<Down>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('c', '<Right>', 'pumvisible() ? "<C-y>" : "<Right>"', {expr = true, noremap = true })
