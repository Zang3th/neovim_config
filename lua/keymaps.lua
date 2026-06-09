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

-- Remap neovide pasting
if vim.g.neovide then
  vim.keymap.set("n", "<C-S-v>", '"+p', opts)
  vim.keymap.set("i", "<C-S-v>", '<C-r>+', opts)
end

-- Add normal pasting to the command line
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- Keybindings for LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set({ "n", "v" }, "<C-f><C-f>", vim.lsp.buf.format, opts)

-- C/C++ declaration to body
vim.keymap.set("n", "<tab>", function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local line = vim.api.nvim_get_current_line()

    -- Preserve the current line indentation
    local indent = line:match("^%s*") or ""
    local body_indent = indent .. "    "

    -- Remove a trailing semicolon from the declaration
    line = line:gsub("%s*;%s*$", "")
    vim.api.nvim_set_current_line(line)

    -- Insert the function body below the declaration
    vim.fn.append(row, {
        indent .. "{",
        body_indent,
        indent .. "}",
    })

    -- Place the cursor inside the body and enter insert mode
    vim.api.nvim_win_set_cursor(0, { row + 2, #body_indent })
    vim.cmd("startinsert!")
end, { desc = "Convert declaration to function body" })

local M = {}

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

-- Keybindings for auto-session
function M.auto_session_keymaps()
    vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession search<CR>", { desc = "Session search" })
    vim.keymap.set("n", "<leader>sw", "<cmd>AutoSession save<CR>", { desc = "Save session" })
    vim.keymap.set("n", "<leader>sr", "<cmd>AutoSession restore<CR>", { desc = "Restore session" })
    vim.keymap.set("n", "<leader>sd", "<cmd>AutoSession delete<CR>", { desc = "Delete session" })
end

return M
