-- lua/plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LazyVim already handles nvim-cmp and other core LSP dependencies,
		-- so we don't need to explicitly list them here if you're using LazyVim's defaults.
		-- If you want to use a specific formatter, you might add it here,
		-- but the request was to *not* use any dependencies for lspconfig itself.
	},
	---@class LspConfigOptions
	opts = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		servers = {
			-- Pyright configuration
			pyright = {}, -- Basic pyright setup. lspconfig will find it if it's in your PATH.

			-- Clangd configuration
			clangd = {
				-- Example of common clangd settings. Adjust as needed.
				offsetEncoding = { "utf-16" }, -- or "utf-8", "auto"
				init_options = {
					fallbackFlags = {
						"-std=c++17", -- Or your desired C++ standard
						-- Add include paths if necessary, e.g.:
						-- "-I/usr/local/include",
					},
					-- You might want to specify compile_commands.json search paths
					-- "compileCommandsDir": "build",
				},
			},

			-- Typos-lsp configuration
			typos_lsp = {}, -- Basic typos-lsp setup.

			-- You can add more language servers here following the same pattern
			-- example_server = {
			--   -- server specific options
			-- },
		},
		-- You can add global LSP settings here,
		-- for example, if you want to configure specific capabilities for all servers.
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local servers = opts.servers
		local global_capabilities = opts.capabilities -- Get the global capabilities

		for server_name, server_opts in pairs(servers) do
			-- Merge global capabilities with server-specific ones
			-- Server-specific capabilities will take precedence if defined
			local final_server_opts = vim.tbl_deep_extend(
				"force",
				{ capabilities = global_capabilities }, -- Start with global capabilities
				server_opts -- Apply server-specific options (will overwrite `capabilities` if present)
			)
			lspconfig[server_name].setup(final_server_opts)
		end

		-- Your existing LspAttach autocmd for keybindings and omnifunc
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach_setup", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

				local bufmap = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				bufmap("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				bufmap("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
				bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
				bufmap("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
				bufmap("n", "gR", vim.lsp.buf.references, "[G]oto [R]eferences")
				bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				bufmap("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "[F]ormat")
			end,
		})
	end,
}
