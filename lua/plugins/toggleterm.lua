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
