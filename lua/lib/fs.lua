local M = {}

---@param path string
M.is_executable = function(path)
  local stat = vim.uv.fs_stat(path)
  if not stat then
    return false
  end

  return stat.type == 'file'
    and bit.band(
        stat.mode,
        bit.bor(bit.lshift(1, 3), bit.lshift(1, 6), bit.lshift(1, 9))
      )
      ~= 0
end

M.join = vim.fs.joinpath

M.getcwd = vim.fn.getcwd

M.basename = vim.fs.basename

return M
