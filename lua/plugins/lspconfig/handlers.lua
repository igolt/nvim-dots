local M = {}
local map = require('core.mappings')

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = ' ' },
    { name = 'DiagnosticSignWarn', text = ' ' },
    { name = 'DiagnosticSignInfo', text = ' ' },
    { name = 'DiagnosticSignHint', text = ' ' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = '' }
    )
  end

  local config = {
    virtual_text = true,

    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup LspDocumentHighligh
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          autocmd InsertEnter <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local function buf_set_keymap(...)
    map.buf_set_keymap(bufnr, ...)
  end

  -- Mappings
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  buf_set_keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>')
  buf_set_keymap('n', '<leader>W', vim.lsp.buf.hover)
  buf_set_keymap('n', '<leader>gi', vim.lsp.buf.implementation)
  buf_set_keymap('n', '<C-s>', vim.lsp.buf.signature_help)
  buf_set_keymap('i', '<C-s>', vim.lsp.buf.signature_help)
  buf_set_keymap('n', '<leader>D', vim.lsp.buf.type_definition)
  buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename)
  buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>')
  buf_set_keymap('n', '<leader>d', vim.diagnostic.open_float)
  buf_set_keymap('n', '[d', vim.diagnostic.goto_prev)
  buf_set_keymap('n', ']d', vim.diagnostic.goto_next)
  buf_set_keymap('n', '<leader>f', vim.lsp.buf.formatting)
  buf_set_keymap(
    'x',
    '<leader>f',
    ':lua vim.lsp.buf.range_formatting({tabSize = vim.o.ts})<CR>'
  )
end

M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

M.capabilities = capabilities

return M
