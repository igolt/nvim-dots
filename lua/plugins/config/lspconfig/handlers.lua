local M = {}

M.setup = function()
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
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.INFO] = '',
        [vim.diagnostic.severity.HINT] = '󰌶',
      },
    },
  }
end

---@param bufnr integer
M.set_lsp_keymaps_for_buf = function(bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  buf_set_keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>')
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>')
  buf_set_keymap(
    'n',
    '<leader>W',
    function() vim.lsp.buf.hover { border = 'rounded' } end
  )
  buf_set_keymap('n', '<leader>gi', vim.lsp.buf.implementation)
  buf_set_keymap(
    'i',
    '<C-s>',
    function() vim.lsp.buf.signature_help { border = 'rounded' } end
  )
  buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename)
  buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action)
  buf_set_keymap('n', '<leader>d', vim.diagnostic.open_float)
  buf_set_keymap(
    'n',
    '[d',
    function() vim.diagnostic.jump { count = -1, float = true } end
  )
  buf_set_keymap(
    'n',
    ']d',
    function() vim.diagnostic.jump { count = 1, float = true } end
  )
end

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
---@type lsp.ClientCapabilities?
M.capabilities = ok and cmp_nvim_lsp.default_capabilities() or nil

return M
