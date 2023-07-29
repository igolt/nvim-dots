local definitions = {
  bufs = {
    {
      'BufWritePre',
      { pattern = '/tmp/*', command = 'setlocal noundofile' },
    },
    {
      'BufWritePre',
      { pattern = 'COMMIT_EDITMSG', command = 'setlocal noundofile' },
    },
    {
      'BufWritePre',
      { pattern = 'MERGE_MSG', command = 'setlocal noundofile' },
    },
    {
      'BufWritePre',
      { pattern = '*.tmp', command = 'setlocal noundofile' },
    },
    {
      'BufWritePre',
      { pattern = '*.bak', command = 'setlocal noundofile' },
    },
  },

  wins = {
    -- Equalize window dimensions when resizing vim window
    { 'VimResized', { command = 'tabdo wincmd =' } },
    -- Force write shada when leaving Nvim
    { 'VimLeave', { command = 'wshada!' } },
    -- Check if file changed when its window is focused, more eager than 'autoread'
    { 'FocusGained', { command = 'checktime' } },
  },

  yank = {
    {
      'TextYankPost',
      {
        callback = function()
          vim.highlight.on_yank { higroup = 'Visual' }
        end,
      },
    },
  },
}

for augroup, autocmd_list in pairs(definitions) do
  vim.api.nvim_create_augroup(augroup, {})

  for _, autocmd in ipairs(autocmd_list) do
    local event, options = autocmd[1], autocmd[2]

    options.group = augroup
    vim.api.nvim_create_autocmd(event, options)
  end
end
