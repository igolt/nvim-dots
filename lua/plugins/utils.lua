local M = {}

function M.load_config(config)
  return "require('plugins.config." .. config .. "')"
end

return M
