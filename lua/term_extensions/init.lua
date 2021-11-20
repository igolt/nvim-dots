local Terminal = require('toggleterm.terminal').Terminal

return {
  python_code_runner = function ()
    local filepath = ('"%s"'):format(vim.api.nvim_buf_get_name(0))
    local term = Terminal:new({
      cmd = 'clear; python ' .. filepath .. '; printf "\\nPress enter..."; read -r nothing; exit',
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
      close_on_exit = true,
    })
    term:toggle()
  end,
}
