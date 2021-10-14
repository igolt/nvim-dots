local conf = require('modules.completion.config')

local completion = {
  ['neovim/nvim-lspconfig'] = {
    event = 'BufReadPre',
    config = conf.nvim_lsp
  },

  ['mhartington/formatter.nvim'] = {
    event = 'BufReadPre',
    config = conf.formatter
  },

  ['hrsh7th/nvim-compe'] = {event = 'InsertEnter', config = conf.nvim_compe,},
  ['hrsh7th/vim-vsnip'] = {after = 'nvim-compe', config = conf.vim_vsnip},

  ['windwp/nvim-autopairs'] = {after = 'nvim-compe', config = conf.autopairs},

  ['glepnir/lspsaga.nvim'] = {},

  ['jose-elias-alvarez/null-ls.nvim'] = {},
  ['jose-elias-alvarez/nvim-lsp-ts-utils'] = {},

  ['nvim-telescope/telescope.nvim'] = {
    cmd = 'Telescope',
    config = conf.telescope,
    requires = {
      {'nvim-lua/popup.nvim', opt = true},
      {'nvim-lua/plenary.nvim', opt = true},
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
      },
    }
  },
}

return completion
