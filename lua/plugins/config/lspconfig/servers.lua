local default_on_attach = require('plugins.config.lspconfig.handlers').on_attach
local config = require('config')
local default_capabilities =
  require('plugins.config.lspconfig.handlers').capabilities
local util = require('plugins.config.lspconfig.util')

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
            vim.fn.expand('$VIMRUNTIME/lua'),
            vim.fn.stdpath('config') .. '/lua',
            '${3rd}/luv/library',
          },
        },
      },
    },
  },
  html = {},
  cssls = {},
  vimls = {},
  jsonls = {},
  ruff = {
    ---@param client vim.lsp.Client
    on_attach = function(client) client.server_capabilities.hoverProvider = false end,
  },
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
  gopls = {},
  volar = {
    ---@param new_config vim.lsp.ClientConfig
    ---@param new_root_dir string
    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk =
        util.get_typescript_server_path(new_root_dir)
    end,
  },
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = config.npm.path
            .. 'lib/node_modules/@vue/typescript-plugin',
          languages = { 'javascript', 'typescript', 'vue' },
        },
      },
    },
    filetypes = { 'javascript', 'typescript', 'vue' },
  },
}

local lspconfig = require('lspconfig')

for server, server_conf in pairs(servers) do
  server_conf.on_attach = server_conf.on_attach or default_on_attach
  server_conf.capabilities = server_conf.capabilities or default_capabilities

  lspconfig[server].setup(server_conf)
end
