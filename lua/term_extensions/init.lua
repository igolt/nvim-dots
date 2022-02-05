local Terminal = require('toggleterm.terminal').Terminal

local code_runner = function (cmd)
  local filepath = ('"%s"'):format(vim.api.nvim_buf_get_name(0))
    local term = Terminal:new({
      cmd = 'clear; ' .. cmd .. ' ' .. filepath .. '; printf "\\nPress enter..."; read -r nothing; exit',
      direction = 'horizontal',
      close_on_exit = true,
    })
    term:toggle()
end

return {
  python_code_runner = function () code_runner('python') end,
  c_code_runner = function () code_runner('. ~/.config/bash/functions; csource') end,
}
