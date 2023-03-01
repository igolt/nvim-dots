local colorscheme = require('user.config').colorscheme

if colorscheme ~= nil then
  local has_config, _ = pcall(require, 'core.colorscheme.' .. colorscheme)
  if not has_config then
    vim.cmd.colorscheme(colorscheme)
  end
end
