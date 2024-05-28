local g = vim.g
local opt = vim.opt
local opt_global = vim.opt_global

-- General stuff
g.mapleader = " "
g.maplocalleader = " "
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
-- opt.cmdheight = 0

-- Editor settings
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
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
