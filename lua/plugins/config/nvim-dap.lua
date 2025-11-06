local fs = require('lib.fs')
local dap = require('dap')

local function get_python_command()
  local pythoncmd

  local pythonvenv = fs.join(fs.getcwd(), '.venv', 'bin', 'python')
  if fs.is_executable(pythonvenv) then
    pythoncmd = pythonvenv
  elseif vim.fn.executable('python') == 1 then
    pythoncmd = 'python'
  else
    pythoncmd = 'python3'
  end

  return pythoncmd
end

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    local connect = (config.connect or config)
    local port = connect.port
    local host = connect.host or '127.0.0.1'

    cb {
      type = 'server',
      port = assert(
        port,
        '`connection.port` is required for a Python `attach` configuration'
      ),
      host = host,
      options = { source_filetype = 'python' },
    }
  else
    local python_command = get_python_command()
    print('python_command: ' .. python_command)

    cb {
      type = 'executable',
      command = python_command,
      args = { '-m', 'debugpy.adapter' },
      options = { source_filetype = 'python' },
    }
  end
end

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',

    program = '${file}',
    pythonPath = get_python_command,
  },
}
