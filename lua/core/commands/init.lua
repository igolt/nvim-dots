local code_runner = require('core.commands.code-runner')
local pyright = require('core.commands.pyright')

vim.api.nvim_create_user_command('RunCode', code_runner.run, {})
vim.api.nvim_create_user_command(
  'PyrightQuickfix',
  pyright.diagnostics_to_qf_list,
  {}
)
