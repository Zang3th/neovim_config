-- Shared keymap helper: silent and with a description
local function map(mode, lhs, rhs, desc, opts)
    opts = vim.tbl_extend("force", { silent = true, desc = desc }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Set CTRL + q for quitting windows
map("n", "<C-q>", "<cmd>q<CR>", "Quit window")

-- Set CTRL + Space to open terminal
map("n", "<C-Space>", "<cmd>terminal<CR>", "Open terminal")

-- Set keys for switching between splits
map("n", "<C-h>", "<C-w>h", "Go to left split")
map("n", "<C-j>", "<C-w>j", "Go to lower split")
map("n", "<C-k>", "<C-w>k", "Go to upper split")
map("n", "<C-l>", "<C-w>l", "Go to right split")

-- Keep split navigation working from terminal mode
map("t", "<C-h>", "<C-\\><C-n><C-w>h", "Go to left split")
map("t", "<C-j>", "<C-\\><C-n><C-w>j", "Go to lower split")
map("t", "<C-k>", "<C-\\><C-n><C-w>k", "Go to upper split")
map("t", "<C-l>", "<C-\\><C-n><C-w>l", "Go to right split")

-- Stay in visual (block) mode after indenting
map("x", "<", "<gv", "Indent left")
map("x", ">", ">gv", "Indent right")

-- Toggle comments with the native gc operator, keeping the cursor in place
map("n", "<leader>cc", function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.normal(vim.v.count1 .. "gcc")
    pcall(vim.api.nvim_win_set_cursor, 0, cursor)
end, "Toggle comment line")
map("x", "<leader>cc", "gc", "Toggle comment selection", { remap = true })

-- Map 'ggVG' to CTRL + a
map("n", "<C-a>", "ggVG", "Select all")

-- Keybindings for popup menus (not silent so the cmdline redraws)
local function popup_key(pum_key, key)
    return function()
        return vim.fn.pumvisible() == 1 and pum_key or key
    end
end
map("c", "<Up>", popup_key("<C-p>", "<Up>"), "Previous item", { expr = true, silent = false })
map("c", "<Down>", popup_key("<C-n>", "<Down>"), "Next item", { expr = true, silent = false })
map("c", "<Right>", popup_key("<C-y>", "<Right>"), "Accept item", { expr = true, silent = false })

-- Set keys for horizontal and vertical splitting
map("n", "<leader>sh", "<cmd>split<CR>", "Split horizontally")
map("n", "<leader>sv", "<cmd>vsplit<CR>", "Split vertically")
map("n", "<leader>se", "<cmd>wincmd =<CR>", "Equalize splits")

-- Buffer control
map("n", "<leader>bl", "<cmd>bnext<CR>", "Next buffer")
map("n", "<leader>bh", "<cmd>bprevious<CR>", "Previous buffer")

-- Tab control
map("n", "<leader>tt", "<cmd>tabnew<CR>", "New tab")
map("n", "<leader>tl", "<cmd>tabnext<CR>", "Next tab")
map("n", "<leader>th", "<cmd>tabprevious<CR>", "Previous tab")
map("n", "<leader>td", "<cmd>tabclose<CR>", "Close tab")

-- Open lazy
map("n", "<leader>ll", "<cmd>Lazy<CR>", "Open Lazy")

-- Toggle mini.files
map("n", "<C-e>", function()
    local MiniFiles = require("mini.files")
    if not MiniFiles.close() then
        local path = vim.api.nvim_buf_get_name(0)
        MiniFiles.open(path ~= "" and path or vim.fn.getcwd())
    end
end, "Toggle file explorer")

-- Remap neovide pasting
if vim.g.neovide then
    map("n", "<C-S-v>", "\"+p", "Paste from clipboard")
    map("i", "<C-S-v>", "<C-r>+", "Paste from clipboard")
end

-- Add normal pasting to the command line
map("c", "<C-v>", "<C-r>+", "Paste from clipboard", { silent = false })

-- Keybindings for LSP
map("n", "K", vim.lsp.buf.hover, "LSP hover")
map("n", "gd", vim.lsp.buf.definition, "LSP definition")
map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
map("n", "ga", vim.lsp.buf.code_action, "LSP code action")
map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
map({ "n", "v" }, "<C-f><C-f>", vim.lsp.buf.format, "LSP format")

-- C/C++ declaration to body
map("n", "<Tab>", function()
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
end, "Convert declaration to function body")

local M = {}

-- Restrict searches to these folders when they exist in the cwd
local function search_dirs()
    local dirs = vim.tbl_filter(function(dir)
        return vim.fn.isdirectory(dir) == 1
    end, { "dicadkernel", "data" })
    return #dirs > 0 and dirs or nil
end

-- Keybindings for telescope
function M.telescope_keymaps()
    local builtin = require("telescope.builtin")
    map("n", "<leader>ff", function()
        builtin.find_files({ search_dirs = search_dirs() })
    end, "Find files")
    map("n", "<leader>fg", function()
        builtin.live_grep({ search_dirs = search_dirs() })
    end, "Live grep")
    map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", "Find todos")
end

-- Keybindings for substitute
function M.substitute_keymaps()
    local substitute = require("substitute")
    map("n", "s", substitute.operator, "Substitute with motion")
    map("n", "ss", substitute.line, "Substitute line")
    map("x", "s", substitute.visual, "Substitute selection")
end

-- Keybindings for trouble
function M.trouble_keymaps()
    map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", "Toggle diagnostics")
end

-- Keybindings for vimtex (buffer-local, only in TeX files)
function M.vimtex_keymaps()
    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("VimtexKeymaps", { clear = true }),
        pattern = "tex",
        callback = function(args)
            local buffer = { buffer = args.buf }
            map("n", "<leader>lc", "<cmd>VimtexCompile<CR>", "Compile LaTeX", buffer)
            map("n", "dse", "<Plug>(vimtex-env-delete)", "Delete environment", buffer)
            map("n", "cse", "<Plug>(vimtex-env-change)", "Change environment", buffer)
            map("n", "dsc", "<Plug>(vimtex-cmd-delete)", "Delete command", buffer)
            map("n", "csc", "<Plug>(vimtex-cmd-change)", "Change command", buffer)
        end,
    })
end

-- Keybindings for live-preview (buffer-local, only in previewable files)
function M.live_preview_keymaps()
    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("LivePreviewKeymaps", { clear = true }),
        pattern = { "markdown", "html", "asciidoc", "svg" },
        callback = function(args)
            map("n", "<leader>mp", function()
                if require("livepreview").is_running() then
                    vim.cmd("LivePreview close")
                else
                    vim.cmd("LivePreview start")
                end
            end, "Toggle live preview", { buffer = args.buf })
        end,
    })
end

-- Keybindings for auto-session
function M.auto_session_keymaps()
    map("n", "<leader>ss", "<cmd>AutoSession search<CR>", "Session search")
    map("n", "<leader>sw", "<cmd>AutoSession save<CR>", "Save session")
    map("n", "<leader>sr", "<cmd>AutoSession restore<CR>", "Restore session")
    map("n", "<leader>sd", "<cmd>AutoSession delete<CR>", "Delete session")
end

-- Keybindings for diffview
function M.diffview_keymaps()
    map("n", "<leader>fd", "<cmd>DiffviewOpen<CR>", "Diff changed files")
    map("n", "<leader>fh", "<cmd>DiffviewFileHistory %<CR>", "File history")
end

-- Keybindings for gitsigns (buffer-local)
function M.gitsigns_keymaps(bufnr)
    map("n", "<leader>gb", function()
        require("gitsigns").blame_line({ full = true })
    end, "Git blame line", { buffer = bufnr })
end

return M
