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

local function req(module)
  local ok, res = pcall(require, module)

  if ok then return res end
  Warn(("Could not load module `%s`"):format(module))
end

-- Set mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

unset_map(vim.g.mapleader)
unset_map(vim.g.maplocalleader)

req('plugins')
req('core.options')
req('core.event')
