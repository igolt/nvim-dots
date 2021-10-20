vim.g.nvim_tree_hide_dotfiles = 1
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
  update_focused_file = {
    enable = true,
  },
  view = {
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

-- On Ready Event for Lazy Loading work
require("nvim-tree.events").on_nvim_tree_ready(function()
  vim.cmd("NvimTreeRefresh")
end)
