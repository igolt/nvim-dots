local tools = {
  ['tpope/vim-fugitive'] = {},

  ['iamcco/markdown-preview.nvim'] = {
    ft = 'markdown',
    run = 'cd app && npm install',
    config = [[vim.g.mkdp_auto_start = 0]]
  },
}

return tools
