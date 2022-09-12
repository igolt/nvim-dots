local global = {}

global.home = os.getenv('HOME')
global.cache_dir = os.getenv('XDG_CACHE_HOME') or global.home .. '/.cache'
global.vim_path = vim.fn.stdpath('config')
global.data_dir = vim.fn.stdpath('data') .. '/site'
global.local_plugins_dir = vim.fn.stdpath('data') .. '/local-plugins'

return global
