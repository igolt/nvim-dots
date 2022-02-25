local colorscheme = require('user.config').colorscheme

if colorscheme ~= nil then
  if not pcall(require, "core.colorscheme." .. colorscheme) then
    Warn(('Could not load colorscheme `%s`'):format(colorscheme))
  end
end
