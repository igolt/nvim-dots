local loader = require('packer').loader

loader('plenary.nvim')
loader('popup.nvim')
loader('telescope-fzf-native.nvim')

local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_prefix = '🔭 ',
    selection_caret = "  ",
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'bottom',
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case'
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('vimdots')
telescope.load_extension('project_files')
