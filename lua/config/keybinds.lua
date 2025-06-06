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

vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "<up>", "gk")

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", ":w<CR>")
