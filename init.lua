-- Neovide config
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_scroll_animation_length = 0.1
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_floating_corner_radius = 0.0
    vim.g.neovide_background_color = "#282828"
    vim.g.neovide_title_background_color = "#282828"
    vim.g.neovide_title_text_color = "#ebdbb2"
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_has_mouse_grid_detection = true
end

-- Install lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("settings")
require("keymaps")
require("lazy").setup("plugins")
require("lsp")
