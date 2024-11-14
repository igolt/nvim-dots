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
  indent = { enable = true },
  endwise = { enable = true },
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
    swap = {
      enable = true,
      swap_next = { ['<leader>a'] = '@parameter.inner' },
      swap_previous = { ['<leader>A'] = '@parameter.inner' },
    },
  },
  matchup = {
    enable = true,
    disable = { 'c', 'cpp' },
  },
}
