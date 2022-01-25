local telescope = require('telescope')

require('packer').loader('telescope-fzf-native.nvim')

telescope.setup {
  defaults = {
    prompt_prefix = '🔭 ',
    layout_strategy = 'bottom_pane',
    sorting_strategy = 'ascending',
    layout_config = {
      height = 20,
    },
  },

  pickers = {
    lsp_code_actions = {theme = 'cursor'}
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('vimdots')
