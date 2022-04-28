require'nvim-treesitter.configs'.setup {
  context_commentstring = {enable = true},
  ensure_installed = {
    'c',
    'cpp',
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
    disable = {'lua', 'c', 'cpp', 'html'}
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['in'] = '@block.inner',
        ['an'] = '@block.outer',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ic'] = '@comment.outer',
      }
    }
  },
  matchup = {
    enable = true,
    disable = {'c', 'cpp'}
  }
}
