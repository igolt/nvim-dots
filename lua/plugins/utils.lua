local M = {}

function M.load_config(config)
  local require_arg = 'plugins.config.' .. config

  return string.format([[
    local ok, _ = pcall(require, '%s')

    if not ok then Warn("Failed loading config file for: '%s'") end
  ]], require_arg, config)
end

return M
