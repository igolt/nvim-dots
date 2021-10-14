local telescope = require('telescope')

local function project_files()
  local ok = pcall(require('telescope.builtin').git_files, {})
  if not ok then require('telescope.builtin').find_files({}) end
end

return telescope.register_extension {exports = {project_files = project_files}}
