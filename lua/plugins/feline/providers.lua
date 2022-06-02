local vi_mode_utils = require('feline.providers.vi_mode')

local M = {}

local function get_effective_tabstop(bufnr)
  local bo = bufnr and vim.bo[bufnr] or vim.bo
  local sts = bo.softtabstop
  return (sts > 0 and sts) or (sts < 0 and bo.shiftwidth) or bo.tabstop
end

M.tab_size = function ()
  local sla = vim.api.nvim_buf_get_option(0, 'expandtab') and 'Spaces' or 'Tab Size'
  local tab = get_effective_tabstop(0)

  return string.format('%s: %s', sla, tab)
end

M.position = function ()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  return string.format('Ln %d, Col %d', line, col)
end

M.vi_mode = function ()
  return (' -- %s --'):format(vi_mode_utils.get_vim_mode())
end

M.git_branch = function ()
  local head = vim.b.gitsigns_head or vim.g.gitsigns_head

  return head or '', ' '
end

M.file_type = function ()
  local filetype = vim.bo.filetype

  if filetype == '' then
    return ''
  end

  if filetype == 'toggleterm' then
    filetype = filetype .. '#' .. vim.b.toggle_number
  elseif filetype == 'TelescopePrompt' then
    filetype = 'telescope'
  end

  return filetype == '' and '' or (' %s '):format(filetype:upper())
end

return M
