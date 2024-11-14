local command = vim.api.nvim_create_user_command

local code_runner = require('core.commands.code-runner')
local pyright = require('core.commands.pyright')
local ruff = require('core.commands.ruff')
local git = require('core.commands.git')

command('RunCode', code_runner.run, {})
command('PyrightQuickfix', pyright.diagnostics_to_qflist, {})
command('RuffQuickfix', ruff.diagnostics_to_qflist, {})
command('GitPush', git.push, {})
command('GitPull', git.pull, {})
