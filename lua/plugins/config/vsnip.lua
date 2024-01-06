vim.cmd(
  [[imap <expr> <C-j> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : '<C-j>']]
)
vim.cmd(
  [[smap <expr> <C-j> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : '<C-j>']]
)
vim.cmd(
  [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-o>A']]
)
vim.cmd(
  [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
)

vim.g.vsnip_snippet_dir = USER_CONFIG_PATH .. '/snippets'
