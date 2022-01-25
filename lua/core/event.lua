local definitions = {
  bufs = {
    {"BufWritePre", "/tmp/*"        , "setlocal noundofile"};
    {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"};
    {"BufWritePre", "MERGE_MSG"     , "setlocal noundofile"};
    {"BufWritePre", "*.tmp"         , "setlocal noundofile"};
    {"BufWritePre", "*.bak"         , "setlocal noundofile"};
  },

  wins = {
    -- Equalize window dimensions when resizing vim window
    {"VimResized",   "*",  [[tabdo wincmd =]]},
    -- Force write shada when leaving Nvim
    {'VimLeave',     '*',  [[wshada!]]},
    -- Check if file changed when its window is focused, more eager than 'autoread'
    {'FocusGained' , '*',  'checktime'},
  },

  yank = {
    {'TextYankPost', [[* silent! lua vim.highlight.on_yank({higroup='Visual'})]]}
  },
}

for group_name, definition in pairs(definitions) do
  vim.api.nvim_command('augroup ' .. group_name)
  vim.api.nvim_command('autocmd!')

  for _, def in ipairs(definition) do
    local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
    vim.api.nvim_command(command)
  end
  vim.api.nvim_command('augroup END')
end
