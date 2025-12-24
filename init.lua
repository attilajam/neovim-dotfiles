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
vim.g.python3_host_prog = "/usr/bin/python3"

require("config.lazy")
require("config.autocmds")
require("config.keybinds")

local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.add_rules({ rule("$", "$", { "typ", "typst"}):with_move(cond.after_regex("|")) })
