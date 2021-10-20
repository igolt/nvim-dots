require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'cpp',
    'c',
    'html',
    'lua',
    'javascript',
    'typescript',
    'tsx',
    'php',
    'python'
  },
  highlight = {enable = true},
  indent = {
    enable = true,
    disable = {'lua', 'c', 'cpp', 'html', 'python'}
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
