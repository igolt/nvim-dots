local config = {}

function config.vim_matchup()
  vim.g.matchup_matchparen_offscreen = {
    method = 'popup'
  }
end

function config.toggleterm()
  require('toggleterm').setup {
    size = function (term)
      if term.direction == "horizontal" then
        return 15
      else
        return math.floor(vim.o.columns * 0.4)
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '3',
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'horizontal'
  }
end

function config.vim_cursorwod()
  vim.api.nvim_command('augroup user_plugin_cursorword')
  vim.api.nvim_command('autocmd!')
  vim.api.nvim_command('autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0')
  vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
  vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
  vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
  vim.api.nvim_command('augroup END')
end

function config.vim_easy_align()
  local remap = vim.api.nvim_set_keymap;

  remap('n', 'ga', '<Plug>(EasyAlign)', {})
  remap('x', 'ga', '<Plug>(EasyAlign)', {})
end

return config
