local lsp_utils = require('plugins.config.lspconfig.utils')
local lsp_servers = require('plugins.config.lspconfig.servers')
local lspconfig = require('lspconfig')

-- Configure the language servers
for server, config in pairs(lsp_servers) do
  if not config.on_attach then config.on_attach = lsp_utils.on_attach.set_lsp_keymappings end
  if not config.capabilities then config.capabilities = lsp_utils.make_capabilities() end
  lspconfig[server].setup(config)
end

lsp_utils.set_pretty_completion_item_kind()

-- Set iconic signs for the diagnostics
lsp_utils.set_iconic_signs()
