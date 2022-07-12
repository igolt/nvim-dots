local autocmd = vim.api.nvim_create_autocmd

local function highlight_on_yank()
  vim.highlight.on_yank { higroup = 'Visual' }
end

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
    { 'TextYankPost', { callback = highlight_on_yank } },
  },
}

for group_name, definition in pairs(definitions) do
  vim.api.nvim_create_augroup(group_name, {})

  for _, def in ipairs(definition) do
    def[2].group = group_name
    autocmd(def[1], def[2])
  end
end
