-- Configure some general stuff
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<C-q>', ':Ex<CR>', { noremap = true, silent = true })

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

-- Install a package manager (lazy)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define all the plugins you want to have
local plugins = {
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.7',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }
}
local opts = {}

-- Inititialize and configure all plugins
require("lazy").setup(plugins, opts)

require("gruvbox").setup()
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")

config.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "cpp", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})
