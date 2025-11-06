local fs = require('lib.fs')
local Terminal = require('toggleterm.terminal').Terminal

---@param cmd string
local code_runner = function(cmd)
  return function()
    local filepath = ('%q'):format(vim.api.nvim_buf_get_name(0))
    local term = Terminal:new {
      cmd = cmd
        .. ' '
        .. filepath
        .. '; printf "\\nPress enter..."; read -r; exit',
      direction = 'horizontal',
      close_on_exit = true,
    }
    term:toggle()
  end
end

local function c_code_runner()
  local filepath = vim.api.nvim_buf_get_name(0)
  local basename = fs.basename(filepath)
  local out = ('/tmp/%s.a.out'):format(basename)

  local cc_and_run = ('cc %q -o %q; %q'):format(filepath, out, out)
  local rm_out = ('rm -f %q'):format(out)

  local term = Terminal:new {
    cmd = cc_and_run
      .. '; printf "\\nPress enter..."; read -r;'
      .. rm_out
      .. '; exit',
    direction = 'horizontal',
    close_on_exit = true,
  }
  term:toggle()
end

local code_runners = {
  python = code_runner('python'),
  lua = code_runner('lua'),
  javascript = code_runner('node'),
  c = c_code_runner,
}

return {
  run = function()
    local ft = vim.bo.filetype
    local runner = code_runners[ft]
    if runner then
      runner()
    end
  end,
}
