-- lua/plugins/treesitter.lua

return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		opts = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"lua",
				"vim",
				"typst",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"python",
				"query",
				"regex",
				"go",
				"cpp",
				"c",
				"java",
				"rust",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			-- Optional: enable incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<c-backspace>",
				},
			},

			highlight = {
				enable = true,
				-- Set this to `true` if you enable content for all filetypes.
				-- If you set this to `true`, you will need to list the filetypes you want to disable
				-- in `disable` list.
				disable = {},
				-- `false` will disable the whole extension
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = true, disable = {} },

			-- Optional: enable nvim-treesitter-textobjects (if you want to use it)
			-- If you enable this, you will need to install nvim-treesitter-textobjects plugin separately
			-- For example, by adding it to your `ensure_installed` list in another plugin file or here.
			-- textobjects = {
			--   select = {
			--     enable = true,
			--     lookahead = true, -- Automatically jump to the next match
			--     keymaps = {
			--       -- You can use the default mapping or define your own
			--       -- `v_` for visual mode selection, `a_` for around, `i_` for inner
			--       ["af"] = "@function.outer",
			--       ["if"] = "@function.inner",
			--       ["ac"] = "@class.outer",
			--       ["ic"] = "@class.inner",
			--       ["a_"] = "@block.outer",
			--       ["i_"] = "@block.inner",
			--     },
			--   },
			-- },
		},
		config = function(_, opts)
			-- This `config` function is called by Lazy.nvim after the plugin is loaded.
			-- It's a good place to call setup functions or apply final configurations.
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- If you want to use nvim-treesitter-textobjects, you'd add it here as another plugin entry:
	-- {
	--   "nvim-treesitter/nvim-treesitter-textobjects",
	--   dependencies = { "nvim-treesitter/nvim-treesitter" },
	--   after = "nvim-treesitter",
	-- },
}
