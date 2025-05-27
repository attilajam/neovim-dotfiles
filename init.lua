-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit color
vim.opt.termguicolors = true

require("config.lazy")
require("config.lsp")
require("config.autocmds")
require("config.keybinds")
