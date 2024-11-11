local default_on_attach = require('plugins.config.lspconfig.handlers').on_attach
local default_capabilities =
  require('plugins.config.lspconfig.handlers').capabilities

local servers = {
  clangd = {
    cmd = {
      'clangd',
      '--background-index',
      '--suggest-missing-includes',
      '--clang-tidy',
      '--header-insertion=iwyu',
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.stdpath('config') .. '/lua'] = true,
          },
        },
      },
    },
  },
  html = {},
  cssls = {},
  vimls = {},
  jsonls = {},
  ruff = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'openFilesOnly',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'basic',
        },
      },
    },
  },
  rust_analyzer = {},
}

local lspconfig = require('lspconfig')

for server, config in pairs(servers) do
  config.on_attach = config.on_attach or default_on_attach
  config.capabilities = config.capabilities or default_capabilities

  lspconfig[server].setup(config)
end
