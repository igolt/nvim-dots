require('core.notify')

-- Disable distribution plugins
vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1

local function unset_map(lhs)
  vim.api.nvim_set_keymap('n', lhs, '', {noremap = true})
  vim.api.nvim_set_keymap('v', lhs, '', {noremap = true})
end

-- Set mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

unset_map(vim.g.mapleader)
unset_map(vim.g.maplocalleader)

local pack = require('plugins')

pack.ensure_plugins()
pcall(require, 'core.options')
pcall(require, 'core.event')
pack.setup()
