return {
  cmd = { "solargraph", "stdio" },
  settings = {
    Solargraph = {
      commandPath = "/Users/joshloesch/.rbenv/shims/solargraph",
      diagnostics = true,
      root_dir = function(fname)
        return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
      end
    },
  },
}
