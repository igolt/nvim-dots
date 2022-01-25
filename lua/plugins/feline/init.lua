local stlineconfig = require('user.config').statusline

if not stlineconfig or not stlineconfig.preset then
  require('feline').setup()
  return
end

local preset = stlineconfig.preset

local ok, config = pcall(require, 'plugins.feline.presets.' .. preset)
if not ok then
  Warn(('Could not load `%s` status line preset\nFallbacking to default'):format(preset))
  config = {}
end

require('feline').setup(config)
