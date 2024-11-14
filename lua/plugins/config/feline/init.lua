local stlineconfig = require('config').statusline

local config = {}
if stlineconfig and stlineconfig.preset then
  local preset = stlineconfig.preset
  local ok
  ok, config = pcall(require, 'plugins.config.feline.presets.' .. preset)
  if ok then
    if config.theme == nil and vim.g.colors_name then
      local theme
      ok, theme = pcall(require, 'plugins.feline.themes.' .. vim.g.colors_name)
      if ok then
        config.theme = theme
      end
    end
  else
    vim.notify(
      ('Could not load status line preset %q\nFallbacking to default'):format(
        preset
      ),
      vim.log.levels.WARN
    )
    config = { theme = 'default' }
  end
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
