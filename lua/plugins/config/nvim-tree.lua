vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
  default =  '',
  symlink =  '',
  git = {
    unstaged = "✚",
    staged =  "✚",
    unmerged =  "≠",
    renamed =  "≫",
    untracked = "★",
  },
}

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
    number = true,
    relativenumber = true,
    signcolumn = "no",
    auto_resize = true,
    hide_root_folder = true,
    mappings = {
      costom_only = false,
      list = {
        {key = {'l'}, cb = "<cmd>lua require'nvim-tree'.on_keypress('edit')<CR>"};
        {key = {'s'}, cb = "<cmd>lua require'nvim-tree'.on_keypress('vsplit')<CR>"};
        {key = {'i'}, cb = "<cmd>lua require'nvim-tree'.on_keypress('split')<CR>"};
      }
    }
  }
}
