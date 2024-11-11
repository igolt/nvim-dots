require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff', 'ruff_format' },
  },

  format_after_save = {
    lsp_format = 'fallback',
  },
}
