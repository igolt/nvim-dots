local conf = require('modules.lang.config')

local lang = {
  ['windwp/nvim-ts-autotag'] = {
    after = 'nvim-treesitter',
    config = function ()
      require('nvim-ts-autotag').setup()
    end
  },

  ['nvim-treesitter/nvim-treesitter-textobjects'] = {
    after = 'nvim-treesitter'
  },

  ['nvim-treesitter/nvim-treesitter'] = {
    run = ':TSUpdate',
    event = 'BufEnter',
    config = conf.nvim_treesitter,
  },
}

return lang
