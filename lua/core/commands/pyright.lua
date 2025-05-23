local M = {}

---@param msg string
---@param level integer?
---@param opts table?
local function notify(msg, level, opts)
  opts = opts or {}
  opts.title = 'Pyright'
  vim.notify(msg, level, opts)
end

---@param path string?
M.diagnostics_to_qflist = function(path)
  local timer_handle = vim.defer_fn(
    function() notify('Running Pyright...') end,
    100
  )

  vim.system({ 'pyright', '--outputjson', path }, { text = true }, function(out)
    vim.uv.timer_stop(timer_handle)
    if out.code > 1 or out.signal ~= 0 then
      local msg = 'Failed to execute Pyright'
      if out.stderr then
        msg = msg .. ': ' .. out.stderr
      end
      notify(msg, vim.log.levels.ERROR)
      return
    end

    if out.code == 0 or not out.stdout then
      notify('No errors found')
      return
    end

    local json_output = vim.json.decode(out.stdout)
    local diagnostics = json_output['generalDiagnostics']
    local qf_items = {}
    for _, diag in ipairs(diagnostics) do
      table.insert(qf_items, {
        filename = diag.file,
        text = diag.message,
        lnum = diag.range.start.line + 1,
        end_lnum = diag.range['end'].line + 1,
        col = diag.range.start.character + 1,
        end_col = diag.range.start.character + 1,
        type = diag.severity == 'error' and 'E' or 'W',
      })
    end
    vim.schedule(function()
      vim.fn.setqflist({}, 'r', { title = 'Pyright', items = qf_items })
      vim.cmd('copen')
    end)
  end)
end

return M
