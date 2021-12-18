local utils = {}

function utils.make_capabilities()
  require('packer').loader('nvim-cmp')

  return require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
end

function utils.set_iconic_diagnostics_signs()
  vim.fn.sign_define('DiagnosticSignError', {text = ' ', texthl = 'DiagnosticSignError'})
  vim.fn.sign_define('DiagnosticSignWarn' , {text = ' ', texthl = 'DiagnosticSignWarn'})
  vim.fn.sign_define('DiagnosticSignInfo' , {text = ' ', texthl = 'DiagnosticSignInfo'})
  vim.fn.sign_define('DiagnosticSignHint' , {text = ' ', texthl = 'DiagnosticSignHint'})
end

utils.on_attach = {
  set_lsp_keymappings = function (_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>W', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua require("internal.renamer").rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('x', '<leader>f', ':lua vim.lsp.buf.range_formatting({tabSize = vim.o.ts})<CR>', opts)
  end,
}

utils.on_attach.ts_server = function (client, bufnr)
  utils.on_attach.set_lsp_keymappings(client, bufnr)

  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local ts_utils = require('nvim-lsp-ts-utils')

  ts_utils.setup {
    enable_import_on_completion = true,
    auto_inlay_hints = false,
  }

  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

  ts_utils.setup_client(client)
end

return utils
