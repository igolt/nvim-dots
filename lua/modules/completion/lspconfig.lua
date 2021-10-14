local home_path = require('core.global').home
local lspconfig = require('lspconfig')
local sumneko_root_path = ('%s/Downloads/lua-language-server'):format(home_path)
local sumneko_binary = ('%s/bin/Linux/lua-language-server'):format(sumneko_root_path)
local sumneko_main = ('%s/main.lua'):format(sumneko_root_path)
local nls = require('null-ls')

nls.config {
  save_after_format = false,
  sources = {
    nls.builtins.diagnostics.eslint_d
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
  ['null-ls'] = {}
}

local set_keymappings = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings

  local opts = {noremap=true, silent=true}
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>W', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('x', '<leader>f', '<cmd>lua vim.lsp.buf.range_formatting({tabSize = vim.o.ts})<CR>', opts)
end

require("vim.lsp.protocol").CompletionItemKind = {
  " Text", -- Text
  " Method", -- Method
  "ƒ Function", -- Function
  " Constructor", -- Constructor
  "識 Field", -- Field
  " Variable", -- Variable
  " Class", -- Class
  "ﰮ Interface", -- Interface
  " Module", -- Module
  " Property", -- Property
  " Unit", -- Unit
  " Value", -- Value
  "了 Enum", -- Enum
  " Keyword", -- Keyword
  " Snippet", -- Snippet
  " Color", -- Color
  " File", -- File
  "渚 Reference", -- Reference
  " Folder", -- Folder
  " Enum", -- Enum
  " Constant", -- Constant
  " Struct", -- Struct
  "鬒 Event", -- Event
  "Ψ Operator", -- Operator
  " Type Parameter", -- TypeParameter
}

vim.fn.sign_define('LspDiagnosticsSignHint'       , {text = ' '})
vim.fn.sign_define('LspDiagnosticsSignError'      , {text = ' '})
vim.fn.sign_define('LspDiagnosticsSignWarning'    , {text = ' '})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text = ' '})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits'
  }
}

for lang_server, config in pairs(servers) do
  config.on_attach = set_keymappings
  config.capabilities = capabilities
  lspconfig[lang_server].setup(config)
end

-- configure tsserver separatately
lspconfig.tsserver.setup {
  on_attach = function (client, _)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require('nvim-lsp-ts-utils')

    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = true,
    }

    ts_utils.setup_client(client)
  end
}
