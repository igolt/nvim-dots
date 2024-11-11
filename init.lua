---@alias Notify fun(msg: string, opts: table?)

---@type Notify
Warn = function(msg, opts) vim.notify(msg, vim.log.levels.WARN, opts) end

---@type Notify
Error = function(msg, opts) vim.notify(msg, vim.log.levels.ERROR, opts) end

---@param module string
local function try_load(module)
  local ok, err = pcall(require, module)
  if not ok then
    Warn(('Could not load module `%s`: %s'):format(module, err))
  end
end

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

try_load('core.options')
try_load('core.mappings')
try_load('core.event')
try_load('core.plugins')

local colorscheme = require('config').colorscheme or 'default'
local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  Warn(('Failed to load colorscheme %q: %s'):format(colorscheme, err))
end
