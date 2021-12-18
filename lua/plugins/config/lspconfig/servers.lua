local data_dir = require('core.global').data_dir
local sumneko_root_path = data_dir .. '/lsp/servers/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
local sumneko_main = sumneko_root_path .. '/main.lua'
local lsp_utils = require('plugins.config.lspconfig.utils')
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd
  },
  on_attach = lsp_utils.on_attach.set_lsp_keymappings
})

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
    on_attach = lsp_utils.on_attach.ts_server
  },
}

return servers
