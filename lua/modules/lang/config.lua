local config = {}

config.nvim_treesitter = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'cpp',
      'c',
      'html',
      'lua',
      'javascript',
      'typescript',
      'tsx',
      'php'
    },
    highlight = {enable = true},
    indent = {
      enable = true,
      disable = {'lua', 'c', 'cpp', 'html'}
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        }
      }
    },
    matchup = {
      enable = true,
      disable = {'c', 'cpp'}
    }
  }
end
return config
