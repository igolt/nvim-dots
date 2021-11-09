require'lualine'.setup {
  options = {
    theme = 'auto',
    disabled_filetypes = {'dashboard'},
  },
  extensions = {'fugitive', 'nvim-tree', 'toggleterm', 'quickfix'}
}
