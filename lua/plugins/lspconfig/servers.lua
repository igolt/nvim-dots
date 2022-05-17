local data_dir = require('core.global').data_dir
local sumneko_root_path = data_dir .. '/lsp/servers/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
local sumneko_main = sumneko_root_path .. '/main.lua'
local null_ls = require("null-ls")
local default_on_attach = require('plugins.lspconfig.handlers').on_attach
local default_capabilities = require('plugins.lspconfig.handlers').capabilities

local eslint_d_config = {
  condition = function (utils)
    local function eslint(postfixes)
      local eslintconfig = {}
      for _, postfix in ipairs(postfixes) do
        table.insert(eslintconfig, '.eslintrc.' .. postfix);
      end
      return eslintconfig
    end
    return utils.root_has_file(eslint({'js', 'yml', 'json'}))
  end
}

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.eslint_d.with(eslint_d_config),
    null_ls.builtins.formatting.eslint_d.with(eslint_d_config),
    null_ls.builtins.diagnostics.eslint_d.with(eslint_d_config),
    null_ls.builtins.formatting.prettierd
  },
}

local servers = {
  clangd = {
    cmd = {
      'clangd',
      '--background-index',
      '--suggest-missing-includes',
      '--clang-tidy',
      '--header-insertion=iwyu'
    }
  },

  sumneko_lua = {
    cmd = {sumneko_binary, '-E', sumneko_main},
    settings = {
      Lua = {
        diagnostics = {
          globals = {'screen', 'root', 'client', 'vim', 'packer_plugins', 'awesome'},
        },

        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')]          = true,
            [require('core.global').vim_path .. '/lua'] = true
          },
        },
      },
    },
  },

  tsserver = {
    on_attach = function(client, bufnr)
      local ts_utils = require("nvim-lsp-ts-utils")

      ts_utils.setup {
        import_all_timeout = 2000, -- ms
        auto_inlay_hints = false,
      }

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)

      -- Let null_ls handle formatting
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      -- Format on save
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")

      default_on_attach(client, bufnr)
    end
  },

  html          = {},
  cssls         = {},
  vimls         = {},
  jsonls        = {},
  pyright       = {},
  intelephense  = {},
  rust_analyzer = {},
}

local lspconfig = require('lspconfig')

local set_if_abscent = function (table, field, value)
  if not table[field] then
    table[field] = value
  end
end

for server, config in pairs(servers) do
  set_if_abscent(config, 'on_attach'   , default_on_attach)
  set_if_abscent(config, 'capabilities', default_capabilities)

  lspconfig[server].setup(config)
end

return servers
