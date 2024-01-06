require('ibl').setup({ scope = { enabled = false } })

vim.cmd([[nnoremap <leader><leader>i <cmd>IndentBlanklineToggle<cr>]])
vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_filetype_exclude = {
  'startify',
  'dashboard',
  'dotooagenda',
  'log',
  'fugitive',
  'gitcommit',
  'packer',
  'vimwiki',
  'markdown',
  'txt',
  'man',
  'vista',
  'help',
  'todoist',
  'NvimTree',
  'peekaboo',
  'git',
  'TelescopePrompt',
  'undotree',
  'flutterToolsOutline',
  '', -- for all buffers without a file type
}
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false
