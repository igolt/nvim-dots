local vi_mode_utils = require('feline.providers.vi_mode')

local M = {}

---@param bufnr integer?
---@return integer
local function get_effective_tabstop(bufnr)
  local bo = bufnr and vim.bo[bufnr] or vim.bo
  local sts = bo.softtabstop
  return (sts > 0 and sts) or (sts < 0 and bo.shiftwidth) or bo.tabstop
end

---@return string
M.tab_size = function()
  local tabtype = vim.api.nvim_get_option_value('expandtab', { buf = 0 })
      and 'Spaces'
    or 'Tab Size'
  local tab = get_effective_tabstop()
  return ('%s: %s'):format(tabtype, tab)
end

---@return string
M.position = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ('Ln %d, Col %d'):format(line, col)
end

M.vi_mode =
  function() return (' -- %s --'):format(vi_mode_utils.get_vim_mode()) end

---@return string, string
M.git_branch = function()
  local head = vim.b.gitsigns_head or vim.g.gitsigns_head
  return head or '', ' '
end

---@return string
M.file_type = function()
  local filetype = vim.bo.filetype

  if filetype == '' then
    return ''
  end

  if filetype == 'toggleterm' then
    filetype = 'Terminal#' .. vim.b.toggle_number
  elseif filetype == 'TelescopePrompt' then
    filetype = 'telescope'
  elseif filetype == 'alpha' then
    filetype = 'neovim'
  end
  return (' %s '):format(filetype:upper())
end

return M
