return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("tinymist", {
      cmd = { "tinymist" },
      root_markers = { "typst.toml", ".git" },
      settings = {
        formatterMode = "typstyle",
        exportPdf = "onSave",
        semanticTokens = "disable"
      }
    })
    vim.lsp.enable("tinymist")
  end
}
    
