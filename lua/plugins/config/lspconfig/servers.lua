local set_lsp_keymaps_for_buf =
  require('plugins.config.lspconfig.handlers').set_lsp_keymaps_for_buf
local config = require('config')
local default_capabilities =
  require('plugins.config.lspconfig.handlers').capabilities
local util = require('plugins.config.lspconfig.util')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args) set_lsp_keymaps_for_buf(args.buf) end,
})

vim.lsp.config('*', { capabilities = default_capabilities })

vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.stdpath('config') .. '/lua',
          vim.fn.stdpath('data') .. '/lazy/lazy.nvim/lua',
          vim.fn.stdpath('data') .. '/lazy/nvim-lspconfig/lua',
          '${3rd}/luv/library',
        },
      },
    },
  },
})

vim.lsp.config('ruff', {
  on_attach = function(client) client.server_capabilities.hoverProvider = false end,
})

vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'basic',
        reportPossiblyUnboundVariable = 'error',
        reportUnboundVariable = 'error',
      },
    },
  },
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

vim.lsp.config('vue_ls', {
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk =
      util.get_typescript_server_path(new_root_dir)
  end,
})

vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = config.npm.path .. 'lib/node_modules/@vue/typescript-plugin',
        languages = { 'javascript', 'typescript', 'vue' },
      },
    },
  },
  filetypes = { 'javascript', 'typescript', 'vue' },
})

vim.lsp.enable {
  'docker_compose_language_service',
  'dockerls',
  'prismals',
  'bashls',
  'clangd',
  'lua_ls',
  'html',
  'cssls',
  'vimls',
  'jsonls',
  'ruff',
  'basedpyright',
  'rust_analyzer',
  'gopls',
  'vue_ls',
  'ts_ls',
}
