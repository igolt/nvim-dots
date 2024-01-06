local vi_mode = require('plugins.feline.providers').vi_mode
local git_branch = require('plugins.feline.providers').git_branch
local extract_hl_colors = require('internal.ui').extract_hl_colors

print(vim.inspect(extract_hl_colors('DiagnosticSignError')))

local block = { provider = '▊', hl = 'Comment' }

local error_hl = extract_hl_colors('DiagnosticSignError')
local warn_hl = extract_hl_colors('DiagnosticSignWarn')
local hint_hl = extract_hl_colors('DiagnosticSignHint')

local active_left = {
  block,
  { provider = ' ' },
  { provider = git_branch },
  { provider = ' ' },
  {
    provider = { name = 'diagnostic_errors', opts = { always_visible = true } },
    hl = error_hl,
  },
  {
    provider = {
      name = 'diagnostic_warnings',
      opts = { always_visible = true },
    },
    hl = warn_hl,
  },
  {
    provider = { name = 'diagnostic_hints', opts = { always_visible = true } },
    hl = hint_hl,
  },
  { provider = ' ' },
  { provider = vi_mode },
}

local active_middle = {
  { provider = 'lsp_client_names', icon = '  ', hl = { fg = 'orange' } },
}

local active_right = {
  { provider = 'position' },
  { provider = ' ' },
  { provider = 'file_type' },
  { provider = ' ' },
  { provider = 'file_encoding' },
  { provider = ' ' },
  { provider = 'file_format' },
  { provider = ' ' },
  block,
}

return {
  components = {
    active = { active_left, active_middle, active_right },
    inactive = { { { provider = 'file_info', icon = '' } } },
  },
}
