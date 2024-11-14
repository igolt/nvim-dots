local M = {}

M.push = function()
  local timer_handle = vim.defer_fn(
    function()
      vim.notify(
        'Pushing to remote...',
        vim.log.levels.INFO,
        { title = 'Git Push' }
      )
    end,
    100
  )
  vim.system({ 'git', 'push' }, { text = true }, function(out)
    vim.uv.timer_stop(timer_handle)
    if out.signal ~= 0 then
      return
    end
    local level = out.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR
    vim.notify(out.stderr, level, { title = 'Git Push' })
  end)
end

M.pull = function()
  local timer_handle = vim.defer_fn(
    function()
      vim.notify(
        'Fetching updates...',
        vim.log.levels.INFO,
        { title = 'Git Pull' }
      )
    end,
    100
  )
  vim.system({ 'git', 'pull' }, { text = true }, function(out)
    vim.uv.timer_stop(timer_handle)
    if out.signal ~= 0 then
      return
    end
    local level = out.code == 0 and vim.log.levels.INFO or vim.log.levels.ERROR
    local msg = out.code == 0 and out.stdout or out.stderr
    ---@cast msg string
    vim.notify(msg, level, { title = 'Git Pull' })
  end)
end

return M
