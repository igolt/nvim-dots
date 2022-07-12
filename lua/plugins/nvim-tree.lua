require('nvim-tree').setup {
  sort_by = 'case_sensitve',
  disable_netrw = true,
  hijack_cursor = true,
  open_on_tab = true,
  update_cwd = true,
  diagnostics = { enable = true },
  update_focused_file = { enable = true },
  filters = { custom = { '.git' } },
  actions = { open_file = { resize_window = true } },

  git = {
    enable = true,
    ignore = false,
  },

  view = {
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      list = {
        { key = 'l', action = 'edit' },
        { key = 's', action = 'vsplit' },
        { key = 'i', action = 'split' },
        { key = 'o', action = 'system_open' },
      },
    },
  },

  renderer = {
    indent_markers = { enable = true },
    icons = {
      show = { folder_arrow = false },
      glyphs = {
        git = {
          unstaged = '✚',
          staged = '✚',
        },
      },
    },
  },
}
