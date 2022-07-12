local telescope = require('telescope')

local function vimdots()
  require('telescope.builtin').find_files {
    prompt_title = 'VimDots',
    cwd = require('core.global').vim_path,
  }
end

return telescope.register_extension { exports = { vimdots = vimdots } }
