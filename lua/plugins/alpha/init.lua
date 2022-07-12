vim.cmd(
  [[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]
)

local dashboard = require('alpha.themes.dashboard')
local headers = require('plugins.alpha.headers')

dashboard.section.header.val = headers['heart-pirates']

require('alpha').setup(dashboard.config)
