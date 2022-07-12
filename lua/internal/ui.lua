local M = {}

M.extract_hl_colors = function(hl_group, scope)
  if vim.fn.hlexists(hl_group) == 0 then
    return nil
  end
  local function sla(_color, field, dest)
    if _color[field] ~= nil then
      _color[dest] = string.format('#%06x', _color[field])
      _color[field] = nil
    end
  end
  local color = vim.api.nvim_get_hl_by_name(hl_group, true)
  sla(color, 'background', 'bg')
  sla(color, 'foreground', 'fg')
  return scope and color[scope] or color
end

return M
