local fn, uv, api = vim.fn,vim.loop,vim.api
local vim_path = require('core.global').vim_path
local data_dir = require('core.global').data_dir
local modules_dir = vim_path .. '/lua/modules'
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
  self.repos = {}

  local plugins_list = {}
  local tmp = vim.split(fn.globpath(modules_dir, '*/plugins.lua'), '\n')
  for _, f in ipairs(tmp) do
    plugins_list[#plugins_list+1] = f:sub(#modules_dir - 6, -1)
  end

  for _,m in ipairs(plugins_list) do
    local without_dot_lua = m:sub(0, -5)
    local repositories = require(without_dot_lua)

    for repo, conf in pairs(repositories) do
      self.repos[#self.repos+1] = vim.tbl_extend('force', {repo}, conf)
    end
  end
end

function Packer:load_packer()
  if not packer then
    api.nvim_command('packadd packer.nvim')
    packer = require('packer')
  end
  packer.init({
    git = {clone_timeout = 120},
    disable_commands = true,
    display = {
      open_fn = require('packer.util').float
    }
  })
  packer.reset()
  self:load_plugins()
  packer.use {"wbthomason/packer.nvim", opt = true}
  for _, repo in ipairs(self.repos) do
    packer.use(repo)
  end
end

function Packer:init_ensure_plugins()
  local packer_dir = data_dir .. '/pack/packer/opt/packer.nvim'
  local state = uv.fs_stat(packer_dir)

  if not state then
    api.nvim_command(
      "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
    )
    uv.fs_mkdir(data_dir .. '/lua', 511, function()
      assert("make compile path dir faield")
    end)
    self:load_packer()
    packer.install()
  end
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    if not packer then
      Packer:load_packer()
    end
    return packer[key]
  end
})

function plugins.ensure_plugins()
  Packer:init_ensure_plugins()
end

function plugins.magic_compile()
  print('Calling magic compile')
  plugins.compile()
end

function plugins.auto_compile()
  local file = vim.fn.expand('%:p')
  if file:match(modules_dir) then
    plugins.clean()
    plugins.compile()
  end
end

function plugins.setup()
  vim.cmd [[command! PackerCompile lua require('core.pack').magic_compile()]]
  vim.cmd [[command! PackerInstall lua require('core.pack').install()]]
  vim.cmd [[command! PackerUpdate lua require('core.pack').update()]]
  vim.cmd [[command! PackerSync lua require('core.pack').sync()]]
  vim.cmd [[command! PackerClean lua require('core.pack').clean()]]
  vim.cmd [[autocmd User PackerComplete lua require('core.pack').magic_compile()]]
  vim.cmd [[command! PackerStatus  lua require('packer').status()]]

  local remap = vim.api.nvim_set_keymap;

  remap('n', '<leader>ps', '<cmd>PackerSync<cr>', {noremap = true})
  remap('n', '<leader>pc', '<cmd>PackerCompile<cr>', {noremap = true})
end

return plugins
