local telescope = require('telescope')

local function vimdots()
  require('telescope.builtin').find_files {
    prompt_title = 'VimDots',
    cwd = vim.fn.stdpath('config'),
  }
end

return telescope.register_extension { exports = { vimdots = vimdots } }
