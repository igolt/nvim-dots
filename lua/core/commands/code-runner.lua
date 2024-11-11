local Terminal = require('toggleterm.terminal').Terminal

---@param cmd string
local code_runner = function(cmd)
  local filepath = ('%q'):format(vim.api.nvim_buf_get_name(0))
  return function()
    local term = Terminal:new {
      cmd = 'clear; '
        .. cmd
        .. ' '
        .. filepath
        .. '; printf "\\nPress enter..."; read -r; exit',
      direction = 'horizontal',
      close_on_exit = true,
    }
    term:toggle()
  end
end

local code_runners = {
  python = code_runner('python'),
  lua = code_runner('lua'),
  javascript = code_runner('node'),
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
