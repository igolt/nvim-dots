local headers = require('plugins.config.dashboard.headers')

vim.g.dashboard_custom_header = headers['neovim']

vim.g.dashboard_custom_section = {
  a = {
    description = {' Open Personal dotfiles                SPC f d'},
    command = 'Telescope vimdots'
  },

  b = {
    description = {' Find File                             SPC f f'},
    command = 'Telescope find_files'
  },

  c = {
    description = {' Recently opened files                 SPC f h'},
    command =  'DashboardFindHistory'
  },

  d  = {
    description = {' Jump to book marks                    SPC f b'},
    command = 'Telescope marks'
  },

  e = {
    description = {' Find word                             SPC f a'},
    command = 'DashboardFindWord'
  },
}

vim.cmd [[
augroup augroup UserDashboard
autocmd FileType dashboard nmap <buffer>l <Cr>
autocmd FileType dashboard highlight clear StatusLine
autocmd FileType dashboard set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2
augroup END
]]

vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_disable_at_vimenter = 0
vim.g.dashboard_default_executive = "telescope"
