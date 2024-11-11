require('nvim-treesitter.configs').setup {
  playground = { enable = true },
  -- ensure_installed = {
  --   'c',
  --   'cpp',
  --   'html',
  --   'javascript',
  --   'lua',
  --   'php',
  --   'python',
  --   'rasi',
  --   'tsx',
  --   'typescript',
  -- },
  highlight = { enable = true },
  indent = {
    enable = true,
    disable = { 'lua', 'c', 'cpp', 'html', 'php' },
  },
  endwise = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['in'] = '@block.inner',
        ['an'] = '@block.outer',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ic'] = '@comment.inner',
        ['ac'] = '@comment.outer',
        ['iC'] = '@class.inner',
        ['aC'] = '@class.outer',
      },
    },
  },
  matchup = {
    enable = true,
    disable = { 'c', 'cpp' },
  },
}
