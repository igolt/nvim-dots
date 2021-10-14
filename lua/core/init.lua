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

-- Set mapleader
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', vim.g.mapleader, '', {noremap = true})
vim.api.nvim_set_keymap('v', vim.g.mapleader, '', {noremap = true})

local pack = require('core.pack')

pack.ensure_plugins()
require('core.options')
require('core.event')
pack.setup()
