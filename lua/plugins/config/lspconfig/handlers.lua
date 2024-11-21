local M = {}

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
    { name = 'DiagnosticSignHint', text = '󰌶' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = '' }
    )
  end

  vim.diagnostic.config {
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = true,
      header = '',
      prefix = '',
    },
  }

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })
end

---@param bufnr integer
local function set_lsp_keymaps_for_buf(bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end
  buf_set_keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>')
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>')
  buf_set_keymap('n', '<leader>W', vim.lsp.buf.hover)
  buf_set_keymap('n', '<leader>gi', vim.lsp.buf.implementation)
  buf_set_keymap('i', '<C-s>', vim.lsp.buf.signature_help)
  buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename)
  buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action)
  buf_set_keymap('n', '<leader>d', vim.diagnostic.open_float)
  buf_set_keymap('n', '[d', vim.diagnostic.goto_prev)
  buf_set_keymap('n', ']d', vim.diagnostic.goto_next)
end

---@param _ vim.lsp.Client
---@param bufnr integer
M.on_attach = function(_, bufnr) set_lsp_keymaps_for_buf(bufnr) end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
---@type lsp.ClientCapabilities?
M.capabilities = ok and cmp_nvim_lsp.default_capabilities() or nil

return M
