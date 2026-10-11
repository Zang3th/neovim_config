local g = vim.g
local o = vim.o
local opt = vim.opt
local opt_global = vim.opt_global

-- Windows shell setup
if vim.fn.has("win32") == 1 then
    local pwsh = vim.fn.executable("pwsh") == 1
    o.shell = pwsh and "pwsh" or "powershell"
    o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
        .. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
        .. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    if pwsh then
        o.shellcmdflag = o.shellcmdflag .. "$PSStyle.OutputRendering='PlainText';"
    end
    o.shellpipe = "> %s 2>&1"
    o.shellquote = ""
    o.shellxquote = ""
    o.shelltemp = false
end

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
opt.termguicolors = true
opt.background = "dark"
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
opt.smartindent = true
opt.cindent = true

-- Editor settings
opt.number = true
opt.showmode = false
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
opt.wildmode = "full"

-- Add specific file types
vim.filetype.add({
    extension = {
        vert = "glsl",
        frag = "glsl",
        geom = "glsl",
        comp = "glsl",
        tesc = "glsl",
        tese = "glsl",
    },
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
    },
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
