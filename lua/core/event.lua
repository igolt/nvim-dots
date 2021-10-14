local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup ' .. group_name)
    vim.api.nvim_command('autocmd!')

    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function autocmd.load_autocmds()
  local definitions = {
    bufs = {
      -- Reload vim config automatically
      {"BufWritePost", [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]};
      -- Reload vim script automatically if setlocal autoread
      {"BufWritePost,FileWritePost", "*.vim", [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]};
      {"BufWritePre", "/tmp/*", "setlocal noundofile"};
      {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"};
      {"BufWritePre", "MERGE_MSG", "setlocal noundofile"};
      {"BufWritePre", "*.tmp", "setlocal noundofile"};
      {"BufWritePre", "*.bak", "setlocal noundofile"};
    },

    wins = {
      -- Equalize window dimensions when resizing vim window
      {"VimResized", "*", [[tabdo wincmd =]]},
      -- Force white shada when leaving Nvim
      {'VimLeave', '*', [[if has('nvim') | wshada! | else | wviminfo! | endif]]},
      -- Check if file changed when its window is focused, more eager than 'autoread'
      {'FocusGained', '* checktime'}
    },

    yank = {
      {'TextYankPost', [[* silent! lua vim.highlight.on_yank({higroup='Visual', timeout=100})]]}
    }
  }

  autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
