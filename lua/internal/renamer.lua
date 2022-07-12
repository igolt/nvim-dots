local renamer_opts = {
  buf_prompt = ' ',
}

local function set_if_defined(opts, field)
  local option = opts[field]
  if option then
    renamer_opts[field] = option
  end
end

local function get_opt(opts, field)
  return opts[field] or renamer_opts[field]
end

local function create_rename_prompt_win(opts)
  local bufnr = vim.api.nvim_create_buf(false, true)

  vim.fn.prompt_setprompt(bufnr, get_opt(opts, 'buf_prompt'))

  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'prompt')

  local winid = vim.api.nvim_open_win(bufnr, true, {
    row = 1,
    col = 0,
    height = 1,
    width = 25,
    style = 'minimal',
    border = 'rounded',
    relative = 'cursor',
  })

  vim.api.nvim_win_set_option(winid, 'scrolloff', 0)
  vim.api.nvim_win_set_option(winid, 'sidescrolloff', 0)
  vim.api.nvim_command(
    'autocmd QuitPre <buffer> ++nested ++once :silent lua vim.api.nvim_win_close(0, true)'
  )
  vim.api.nvim_command(
    'autocmd WinLeave <buffer> ++nested ++once :silent lua vim.api.nvim_win_close(0, true)'
  )

  return bufnr, winid
end

return {
  rename = function(opts)
    local current_name = vim.fn.expand('<cword>')
    local pos = { vim.fn.line('.'), vim.fn.col('.') }
    local bufnr, winid = create_rename_prompt_win(opts or {})

    -- append current_name to the prompt
    vim.cmd('normal! i' .. current_name)

    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<Esc>',
      '<cmd>quit<cr>',
      { noremap = true }
    )
    -- For some reason when you press I text is inserted backwards
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'I', '0i', { noremap = true })

    vim.fn.prompt_setcallback(bufnr, function(new_name)
      vim.api.nvim_win_close(winid, true)
      vim.api.nvim_win_set_cursor(0, pos)
      vim.lsp.buf.rename(new_name)
    end)
  end,

  config = function(opts)
    -- TODO(igolt): make it more customizable
    set_if_defined(opts, 'buf_prompt')
  end,
}
