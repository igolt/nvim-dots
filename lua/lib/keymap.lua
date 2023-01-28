local M = {}

M.get_default_opts = function()
  return { noremap = true, silent = true }
end

M.set_keymap = function(mode, lhs, rhs, opts)
  opts = opts or M.get_default_opts()

  vim.keymap.set(mode, lhs, rhs, opts)
end

M.buf_set_keymap = function(buffer, mode, lhs, rhs, opts)
  opts = opts or M.get_default_opts()
  opts.buffer = buffer

  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
