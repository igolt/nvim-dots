vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_show_eob = 0

return {
  mapleader = ' ',
  maplocalleader = ' ',
  colorscheme = 'gruvbox-material',
  statusline = { preset = 'blocks' },
  npm = { path = vim.fn.expand('$HOME/.local/share/npm') },
  plugins = { path = vim.fn.stdpath('data') .. '/lazy' },
}
