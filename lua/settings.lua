local g = vim.g
local o = vim.o
local opt = vim.opt
local opt_global = vim.opt_global

-- Windows stuff
o.shell = "pwsh.exe"
o.shellcmdflag = "-command"
o.shellquote = '"'
o.shellxquote = '"'
g.python3_host_prog = [[C:\Users\Zangeth\AppData\Local\Programs\Python\Python313\python.exe]]
vim.env.PATH = ([[C:\Users\Zangeth\AppData\Local\Programs\Python\Python313;C:\Users\Zangeth\AppData\Local\Programs\Python\Python313\Scripts;]] .. vim.env.PATH)

-- Deactivate specific providers
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- General stuff
g.mapleader = " "
g.maplocalleader = " "
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Deactivate default file explorer
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- UI
g.have_nerd_font = true
opt.termguicolors = true
opt.background = "dark"
opt.lazyredraw = false
opt.fillchars:append({
    eob = " ",
})

-- Line wrap
opt.wrap = true
opt.linebreak = true
opt.showbreak = "›››"
opt.breakindent = true

-- Indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true

-- Editor settings
opt.number = true
opt.showmode = false
opt.backspace = "indent,eol,start"
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 500
opt.splitright = true
opt.splitbelow = true
opt_global.completeopt = { "menu", "menuone", "noselect" }
opt.cursorline = true
opt.conceallevel = 0
opt.listchars = {
    tab = "▸ ",
    trail = "•",
    space = "·",
}
opt.list = true

-- Command line mode
opt.wildmenu = true
opt.wildmode = "full"
opt.history = 200

-- Add specific file types
vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- Configure diagnostic behaviour
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
    virtual_lines = false,
    underline = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})
