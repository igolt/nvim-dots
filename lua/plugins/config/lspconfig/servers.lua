local home_path = require('core.global').home
local sumneko_root_path = home_path .. '/Downloads/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
local sumneko_main = sumneko_root_path .. '/main.lua'
local lsp_utils = require('plugins.config.lspconfig.utils')

local nls = require('null-ls')

nls.config {
  save_after_format = false,
  sources = {
    nls.builtins.diagnostics.eslint_d,
    nls.builtins.formatting.prettierd
  }
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
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          enable = true,
          globals = {'screen', 'root', 'client', 'vim', 'packer_plugins', 'awesome'},
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  html = {},
  cssls = {},
  vimls = {},
  pyright = {},
  intelephense = {},
  rust_analyzer = {},
  tsserver = {
    on_attach = lsp_utils.on_attach.ts_utils,
  },
  ['null-ls'] = {}
}

return servers
