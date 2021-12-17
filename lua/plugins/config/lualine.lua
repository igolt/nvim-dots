require'lualine'.setup {
  options = {
    theme = 'auto',
    disabled_filetypes = {'dashboard'},
    component_separators= '|',
    section_separators = {left = '', right = ''}
  },
  sections = {
    lualine_a = {
      {'mode', separator = {left = ''}, padding = {left = 1, right = 2}}
    },
    lualine_b = {
      'branch',
      {'diagnostics', sources={'nvim_diagnostic'}},
      {'filename', path = 1}
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype', 'fileformat', 'encoding'},
    lualine_z = {
      {'location', separator = {right = ''}}
    }
  },
  extensions = {'fugitive', 'nvim-tree', 'toggleterm', 'quickfix'}
}
