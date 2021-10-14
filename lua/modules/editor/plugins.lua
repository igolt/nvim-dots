local conf = require('modules.editor.config')

local editor = {
  ['itchyny/vim-cursorword'] = {
    event = {'BufReadPre','BufNewFile'},
    config = conf.vim_cursorwod
  },

  ['junegunn/vim-easy-align'] = {
    event = 'BufRead',
    config = conf.vim_easy_align
  },

  ['tpope/vim-repeat'] = {},
  ['tpope/vim-surround'] = {event = 'BufRead'},
  ['tpope/vim-commentary'] = {event = 'BufRead'},


  ['folke/zen-mode.nvim'] = {cmd = 'ZenMode'},
  ['godlygeek/tabular'] = {event = 'BufRead',},
  ['numToStr/BufOnly.nvim'] = {cmd = 'BufOnly'},
  ['editorconfig/editorconfig-vim'] = {event = 'BufRead'},
  ['akinsho/nvim-toggleterm.lua'] = {config = conf.toggleterm},
  ['andymass/vim-matchup'] = {event = 'BufEnter', config = conf.vim_matchup},
}

return editor
