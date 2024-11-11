local vi_mode_utils = require('feline.providers.vi_mode')
local providers = require('plugins.config.feline.providers')

local function with_sep(component_info)
  component_info.right_sep = ' '
  component_info.left_sep = ' '

  return component_info
end

local active_left = {
  {
    provider = providers.vi_mode,
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        style = 'bold',
      }
    end,
  },
  {
    provider = 'file_info',
    hl = { style = 'bold' },
    left_sep = '  ',
    right_sep = ' ',
  },
  {
    icon = ' ',
    provider = providers.git_branch,
    hl = { fg = 'magenta', style = 'bold' },
    left_sep = ' ',
  },
  {
    icon = ' +',
    provider = 'git_diff_added',
    hl = { fg = 'green' },
  },
  {
    icon = ' ~',
    provider = 'git_diff_changed',
    hl = { fg = 'oceanblue' },
  },
  {
    icon = ' -',
    provider = 'git_diff_removed',
    hl = { fg = 'red' },
  },
}

local active_right = {
  {
    provider = 'diagnostic_errors',
    hl = { fg = 'red' },
  },
  {
    provider = 'diagnostic_warnings',
    hl = { fg = 'yellow' },
  },
  {
    provider = 'diagnostic_hints',
    hl = { fg = 'cyan' },
  },
  {
    provider = 'diagnostic_info',
    hl = { fg = 'skyblue' },
  },
  with_sep {
    provider = 'file_format',
  },
  with_sep {
    provider = 'file_encoding',
  },
  {
    provider = { name = 'position', opts = { padding = true } },
  },
  {
    provider = 'line_percentage',
    left_sep = ' ',
  },
  with_sep { provider = 'scroll_bar', hl = { fg = 'orange' } },
}

local inactive_left = {
  {
    provider = providers.file_type,
    hl = { bg = 'violet', fg = 'bg', style = 'bold' },
  },
  {},
}

return {
  components = {
    active = { active_left, active_right },
    inactive = { inactive_left },
  },
}
