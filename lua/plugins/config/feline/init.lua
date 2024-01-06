local stlineconfig = require('user.config').statusline

if not stlineconfig or not stlineconfig.preset then
  require('feline').setup()
  return
end

local preset = stlineconfig.preset

local ok, config = pcall(require, 'plugins.config.feline.presets.' .. preset)
if ok then
  if config.theme == nil and vim.g.colors_name then
    local theme

    ok, theme = pcall(require, 'plugins.feline.themes.' .. vim.g.colors_name)
    if ok then
      config.theme = theme
    end
  end
else
  Warn(
    ('Could not load `%s` status line preset\nFallbacking to default'):format(
      preset
    )
  )
  config = { theme = 'default' }
end

require('feline').setup(vim.tbl_extend('force', config, {
  force_inactive = {
    filetypes = {
      '^NvimTree$',
      '^packer$',
      '^startify$',
      '^fugitive$',
      '^fugitiveblame$',
      '^qf$',
      '^help$',
      '^TelescopePrompt$',
      '^alpha$',
      '^neo\\-tree$',
    },
    buftypes = {
      '^terminal$',
    },
    bufnames = {},
  },
}))
