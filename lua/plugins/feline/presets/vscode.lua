local tab_size = require('plugins.feline.providers').tab_size
local position = require('plugins.feline.providers').position
local git_branch = require('plugins.feline.providers').git_branch
local vi_mode = require('plugins.feline.providers').vi_mode

local active_left = {
  {provider = git_branch, hl = {style = 'bold'}, right_sep = ' ', left_sep = ' '},
  {provider = {name = 'diagnostic_errors'  , opts = {always_visible = true}}},
  {provider = {name = 'diagnostic_warnings', opts = {always_visible = true}}},
  {provider = {name = 'diagnostic_hints'   , opts = {always_visible = true}}},
  {provider = 'lsp_client_names', icon = '  '},
  {provider = '  '},
  {provider = vi_mode},
}

local active_right   = {
  {provider = position},
  {provider = '  '},
  {provider = tab_size},
  {provider = '  '},
  {provider = 'file_encoding'},
  {provider = '  '},
  {provider = 'file_format'},
  {provider = '  '},
  {provider = 'file_type'},
  {provider = '  '},
}

return {
  theme = {
    fg = '#928374',
    bg = '#282828',
  },
  components = {
    active   = {active_left, active_right},
    inactive = {{{provider = 'file_info', icon = ''}}}
  }
}
