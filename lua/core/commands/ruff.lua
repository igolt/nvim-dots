local M = {}

---@param msg string
---@param level integer?
---@param opts table?
local function notify(msg, level, opts)
  opts = opts or {}
  opts.title = 'Ruff'
  vim.notify(msg, level, opts)
end

M.diagnostics_to_qflist = function()
  vim.system(
    { 'ruff', 'check', '--output-format', 'json' },
    { text = true },
    function(out)
      if out.code ~= 1 then
        local msg = out.code == 0 and 'No error found' or 'Failed to run Ruff'
        local level = out.code == 0 and vim.log.levels.INFO
          or vim.log.levels.ERROR
        notify(msg, level)
        return
      end

      local diagnostics = vim.json.decode(out.stdout)
      local qf_items = {}
      for _, diag in ipairs(diagnostics) do
        table.insert(qf_items, {
          filename = diag.filename,
          text = diag.message,
          lnum = diag.location.row,
          end_lnum = diag.end_location.row,
          col = diag.location.column,
          end_col = diag.end_location.column,
        })
      end
      vim.schedule(function()
        vim.fn.setqflist({}, 'r', { title = 'Ruff', items = qf_items })
        vim.cmd('copen')
      end)
    end
  )
end

return M
