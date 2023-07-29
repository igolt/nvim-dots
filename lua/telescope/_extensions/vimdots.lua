local telescope = require('telescope')

local function vimdots()
  require('telescope.builtin').find_files {
    prompt_title = 'VimDots',
    cwd = USER_CONFIG_PATH,
  }
end

return telescope.register_extension { exports = { vimdots = vimdots } }
