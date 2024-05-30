-- Set CNTRL + q for quitting windows
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })

-- Set keys for switching between splits
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })
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

-- Map 'ggVG' to CNTRL + a
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
