local notify_is_loaded, notify = pcall(require, 'notify')
if notify_is_loaded then
  vim.notify = notify
end

Warn  = function (msg, opts) vim.notify(msg, vim.log.levels.WARN, opts) end
Error = function (msg, opts) vim.notify(msg, vim.log.levels.ERROR, opts) end

local function load_if_possible_or_warn(module)
  local loaded_successfully = pcall(require, module)

  if not loaded_successfully then
    Warn(("Could not load module `%s`"):format(module))
  end
end

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

load_if_possible_or_warn('core.globals')
load_if_possible_or_warn('core.options')
load_if_possible_or_warn('core.event')
load_if_possible_or_warn('core.mappings')
load_if_possible_or_warn('core.colorscheme')
load_if_possible_or_warn('core.plugins')
