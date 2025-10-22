-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit color
vim.opt.termguicolors = true

vim.g.R_app = "radian"
vim.g.R_cmd = "radian"
vim.g.R_hl_term = 0
vim.g.R_args = {}
vim.g.R_bracketed_paste = 1

require("config.lazy")
require("config.lsp")
require("config.autocmds")
require("config.keybinds")
