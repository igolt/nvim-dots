local config = require('config')

require('luasnip').config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

-- vscode format
require('luasnip.loaders.from_vscode').lazy_load {
  paths = { './snippets', config.plugins.path .. '/friendly-snippets' },
}

vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    if
      require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end,
})
