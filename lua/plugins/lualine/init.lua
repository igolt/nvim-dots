local stlineconfig = require('user.config').statusline
if not stlineconfig or not stlineconfig.preset then
  require('lualine').setup()
  return
end

local preset = stlineconfig.preset

local ok, config = pcall(require, 'plugins.lualine.presets.' .. preset)
if not ok then
  Warn(('Could not load `%s` status line preset\nFallbacking to default'):format(preset))
  require('lualine').setup()
  return
end

require('lualine').setup(config)
