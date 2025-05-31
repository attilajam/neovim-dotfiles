-- lua/plugins/conform.lua

return {
	{
		"stevearc/conform.nvim",
		lazy = false, -- We want formatters to be available early
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "n",
				desc = "Format buffer (conform)",
			},
			{
				"<leader>fM",
				function()
					require("conform").format({ async = true, lsp_fallback = true, bufnr = 0 })
				end,
				mode = "v",
				desc = "Format selection (conform)",
			},
		},
		opts = {
			-- Customize the formatters for each filetype
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				-- You can add other formatters for other filetypes here
				-- python = { "isort", "black" },
				-- javascript = { "prettier" },
				-- html = { "prettier" },
				-- css = { "prettier" },
			},
			formatters = {
				["clang-format"] = {},
			},
			-- Enable auto-formatting on save
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		},
		init = function()
			-- If you want to enable auto-format on save for a specific filetype
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			--   group = vim.api.nvim_create_augroup("ConformFormat", { clear = true }),
			--   callback = function(args)
			--     if require("conform").list_formatters(args.buf) ~= nil then
			--       require("conform").format({ bufnr = args.buf, lsp_fallback = true, async = false })
			--     end
			--   end,
			-- })
		end,
	},
}
