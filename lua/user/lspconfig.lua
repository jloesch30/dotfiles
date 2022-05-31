-- loop over servers to add them
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
  "jsonls",
  "sumneko_lua",
  "pyright",
  "tsserver",
  "tailwindcss",
  "cssls",
  "emmet_ls",
  "rome",
}
for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

-- turning off formatting for some servers
require("lspconfig").tsserver.setup({
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})
