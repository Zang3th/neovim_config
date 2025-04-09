local opts = { noremap = true, silent = true }

-- Set CTRL + q for quitting windows
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", opts)

-- Set keys for switching between splits
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Stay in visual mode after indenting
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- Stay in visual block mode after indenting
vim.api.nvim_set_keymap("x", "<", "<gv", opts)
vim.api.nvim_set_keymap("x", ">", ">gv", opts)

-- Map 'ggVG' to CTRL + a
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", opts)

-- Keybindings for popup menus
vim.api.nvim_set_keymap('c', '<Up>', 'pumvisible() ? "<C-p>" : "<Up>"', opts)
vim.api.nvim_set_keymap('c', '<Down>', 'pumvisible() ? "<C-n>" : "<Down>"', opts)
vim.api.nvim_set_keymap('c', '<Right>', 'pumvisible() ? "<C-y>" : "<Right>"', opts)

-- Set keys for horizontal and vertical splitting
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>se", ":wincmd =<CR>", opts)

-- Buffer control
vim.api.nvim_set_keymap("n", "<leader>bl", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bh", ":bprevious<CR>", opts)

-- Tab control
vim.api.nvim_set_keymap("n", "<leader>tt", ":tabnew<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tl", ":tabnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>th", ":tabprevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>td", ":tabclose<CR>", opts)

-- Open lazy
vim.api.nvim_set_keymap("n", "<leader>ll", ":Lazy<CR>", opts)

-- Toggle nvimtree
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Keybindings for neogit
vim.api.nvim_set_keymap("n", "<leader>gg", ":Neogit<CR>", opts)

-- Keybindings for diffview
vim.api.nvim_set_keymap("n", "<leader>fd", ":DiffviewOpen<CR>", opts)

function SetDiffviewKeymaps()
    vim.api.nvim_buf_set_keymap(0, "n", "<C-q>", ":DiffviewClose<CR>", opts)
end

vim.cmd([[
    augroup DiffviewKeymaps
        autocmd!
        autocmd FileType DiffviewFiles lua SetDiffviewKeymaps()
    augroup END
]])

local M = {}

-- Keybindings for comments
function M.comment_keymaps()
    local comment = require("Comment.api")
    vim.keymap.set("n", "<leader>cc", comment.toggle.linewise.current, opts)
    vim.keymap.set("n", "<leader>bc", comment.toggle.blockwise.current, opts)
    vim.keymap.set("v", "<leader>cc", function()
        comment.toggle.linewise(vim.fn.visualmode())
    end, opts)
    vim.keymap.set("v", "<leader>bc", function()
        comment.toggle.blockwise(vim.fn.visualmode())
    end, opts)
end

-- Keybinding for markdown-preview
function M.markdown_preview_keymaps()
    vim.api.nvim_set_keymap("n", "<C-m>", ":MarkdownPreviewToggle<CR>", opts)
end

-- Keybindings for telescope
function M.telescope_keymaps()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", {})
end

-- Keybindings for substitute
function M.substitute_keymaps()
    local substitute = require("substitute")
    vim.keymap.set("n", "s", substitute.operator, {})
    vim.keymap.set("n", "ss", substitute.line, {})
    vim.keymap.set("x", "s", substitute.visual, {})
end

-- Keybindings for trouble
function M.trouble_keymaps()
    vim.api.nvim_set_keymap("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", {})
end

-- Keybindings for vimtex
function M.vimtex_keymaps()
    vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", {})
    vim.keymap.set("n", "dse", "<Plug>(vimtex-env-delete)", {})
    vim.keymap.set("n", "cse", "<Plug>(vimtex-env-change)", {})
    vim.keymap.set("n", "dsc", "<Plug>(vimtex-cmd-delete)", {})
    vim.keymap.set("n", "csc", "<Plug>(vimtex-cmd-change)", {})
end

return M
