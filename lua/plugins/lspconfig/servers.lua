local null_ls = require('null-ls')
local default_on_attach = require('plugins.lspconfig.handlers').on_attach
local default_capabilities = require('plugins.lspconfig.handlers').capabilities

local eslint_d_config = {
  condition = function(utils)
    local function eslint(postfixes)
      local eslintconfig = {}

      for _, postfix in ipairs(postfixes) do
        table.insert(eslintconfig, '.eslintrc.' .. postfix)
      end
      return eslintconfig
    end
    return utils.root_has_file(eslint { 'js', 'yml', 'json' })
  end,
}

-- Let null_ls handle formatting
local function null_ls_format_on_save(client)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  -- Format on save
  vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
end

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.eslint_d.with(eslint_d_config),
    null_ls.builtins.formatting.eslint_d.with(eslint_d_config),
    null_ls.builtins.diagnostics.eslint_d.with(eslint_d_config),

    null_ls.builtins.formatting.prettierd,
    require('typescript.extensions.null-ls.code-actions')
  },
}

local servers_configuration = {
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

        diagnostics = {
          globals = {
            'vim',
            'packer_plugins',
          },
        },

        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [USER_CONFIG_PATH .. '/lua'] = true,
          },
        },
      },
    },
  },
  jdtls = {},
  html = {},
  cssls = {},
  vimls = {},
  jsonls = {},
  pyright = {},
  phpactor = {},
  rust_analyzer = {},
}

local lspconfig = require('lspconfig')

local set_if_abscent = function(table, field, value)
  if not table[field] then
    table[field] = value
  end
end

for server_name, config in pairs(servers_configuration) do
  set_if_abscent(config, 'on_attach', default_on_attach)
  set_if_abscent(config, 'capabilities', default_capabilities)

  lspconfig[server_name].setup(config)
end

require('typescript').setup {
  server = {
    on_attach = function (client, bufnr)
      null_ls_format_on_save(client)
      default_on_attach(client, bufnr)
    end
  }
}
