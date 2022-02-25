vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
  default =  '',
  git = {
    unstaged = "✚",
    staged =  "✚",
  },
}

vim.g.nvim_tree_special_files = {}

require('nvim-tree').setup {
  disable_netrw = true,
  open_on_tab = true,
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {enable = true},
  filters = {custom = {'.git'}},
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    -- number = true,
    -- relativenumber = true,
    -- signcolumn = "no",
    auto_resize = true,
    hide_root_folder = true,
    mappings = {
      costom_only = false,
      list = {
        {key = 'l', action = "edit"};
        {key = 's', action = "vsplit"};
        {key = 'i', action = "split"};
        {key = 'o', action = "system_open"};
      }
    }
  }
}
