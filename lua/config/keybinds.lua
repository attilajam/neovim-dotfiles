-- example keybinds
vim.keymap.set("n", "<leader>ts", function()
	require("typst-concealer").enable_buf(vim.fn.bufnr())
end)
vim.keymap.set("n", "<leader>th", function()
	require("typst-concealer").disable_buf(vim.fn.bufnr())
end)

vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>")
vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>")
vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>")
vim.keymap.set("n", "<leader>ms", ":noautocmd MoltenEnterOutput<CR>",
    { silent = true, desc = "show/enter output" })
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "<up>", "gk")

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", ":w<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.api.nvim_set_keymap('n', '<S-Up>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Left>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Right>', '<Right>', { noremap = true })
