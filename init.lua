-- Disable distribution plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

---@param module string
local function try_load(module)
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify(
      ('Could not load module %q: %s'):format(module, err),
      vim.log.levels.WARN
    )
  end
end

try_load('core.options')
try_load('core.mappings')
try_load('core.event')
try_load('core.plugins')
try_load('core.commands')

local colorscheme = require('config').colorscheme or 'default'
local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  vim.notify(
    ('Failed to load colorscheme %q: %s'):format(colorscheme, err),
    vim.log.levels.WARN
  )
end
