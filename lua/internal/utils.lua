local shellescape = vim.fn.shellescape
local substitute = vim.fn.substitute
local expand = vim.fn.expand

local uv = vim.loop
local fmt = string.format

local M = {}

M.open_url = function (uri)
  if not uri then
    uri = expand('<cfile>')
    uri = substitute(uri, '?', '\\?', '')
    uri = shellescape(uri, 1)

    if uri == '' then return end
  end

  vim.cmd(fmt("silent! !xdg-open %s", uri))
end

return M
