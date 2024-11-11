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

return {
  python_code_runner = code_runner('python'),
  c_code_runner = code_runner('. ~/.config/bash/functions; csource'),
  cpp_code_runner = code_runner('. ~/.config/bash/functions; cppsource'),
  node_code_runner = code_runner('node'),
}
