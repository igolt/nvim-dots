local util = require('lspconfig.util')
local config = require('config')

local M = {}

---@param root_dir string
M.get_typescript_server_path = function(root_dir)
  local global_ts = config.npm.path .. '/lib/node_modules/typescript/lib'

  local found_ts = ''
  ---@param path string
  local function check_dir(path)
    found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
    return util.path.exists(found_ts) and path or nil
  end
  return util.search_ancestors(root_dir, check_dir) and found_ts or global_ts
end

return M
