local M = {}

-- If toggleterm is not loaded, load it
local toggleterm = 'nvim-toggleterm.lua'

if not packer_plugins[toggleterm].loaded then
  vim.cmd(string.format('packadd %s', toggleterm))
end

local nnn_term = require('toggleterm.terminal').Terminal:new({
  cmd = 'nnn',
  hidden = true,
  direction = 'float',
  float_opt = {border = 'double'}
})

function M.nnn_toggle()
  nnn_term:toggle()
end

return M
