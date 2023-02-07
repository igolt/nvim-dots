local colorscheme = require('user.config').colorscheme

if colorscheme ~= nil then
  pcall(require, 'core.colorscheme.' .. colorscheme)
  vim.cmd.colorscheme(colorscheme)
end
