local langs = {
  'gitcommit',
  'go',
  'c',
  'cpp',
  'html',
  'javascript',
  'prisma',
  'lua',
  'php',
  'python',
  'rasi',
  'tsx',
  'typescript',
}

require('nvim-treesitter').install(langs)

-- require('nvim-treesitter').setup {
--   playground = { enable = true },
--   ensure_installed = {
--     'gitcommit',
--     'go',
--     'c',
--     'cpp',
--     'html',
--     'javascript',
--     'prisma',
--     'lua',
--     'php',
--     'python',
--     'rasi',
--     'tsx',
--     'typescript',
--   },
--   highlight = { enable = true },
--   indent = { enable = true },
--   endwise = { enable = true },
--   textobjects = {
--     move = {
--       enable = true,
--       set_jumps = true, -- whether to set jumps in the jumplist
--       goto_next_start = {
--         [']m'] = '@function.outer',
--         [']]'] = '@class.outer',
--       },
--       goto_next_end = {
--         [']M'] = '@function.outer',
--         [']['] = '@class.outer',
--       },
--       goto_previous_start = {
--         ['[m'] = '@function.outer',
--         ['[['] = '@class.outer',
--       },
--       goto_previous_end = {
--         ['[M'] = '@function.outer',
--         ['[]'] = '@class.outer',
--       },
--     },
--     select = {
--       enable = true,
--       keymaps = {
--         ['in'] = '@block.inner',
--         ['an'] = '@block.outer',
--         ['af'] = '@function.outer',
--         ['if'] = '@function.inner',
--         ['ic'] = '@comment.inner',
--         ['ac'] = '@comment.outer',
--         ['iC'] = '@class.inner',
--         ['aC'] = '@class.outer',
--       },
--     },
--     swap = {
--       enable = true,
--       swap_next = { ['<leader>a'] = '@parameter.inner' },
--       swap_previous = { ['<leader>A'] = '@parameter.inner' },
--     },
--   },
--   matchup = {
--     enable = true,
--   },
-- }
