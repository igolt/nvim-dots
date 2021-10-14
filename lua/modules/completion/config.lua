local config = {}

function config.nvim_compe()
  require'compe'.setup {
    enabled = true,
    debug = false,
    min_length = 1,
    preselect = 'disable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      calc = true,
      path = true,
      vsnip = true,
      buffer = true,
      nvim_lsp = true,
      nvim_lua = true,
      tags = false,
      spell = false,
      snippets_nvim = false,
    },
  }
end

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.vim_vsnip()
  vim.cmd [[imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  vim.cmd [[smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzf-native.nvim]]
  end

  require('telescope').setup {
    defaults = {
      prompt_prefix = '🔭 ',
      selection_caret = "  ",
      sorting_strategy = 'ascending',
      layout_config = {
        prompt_position = 'bottom',
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case'
      }
    }
  }

  require('telescope').load_extension('fzf')
  require('telescope').load_extension('vimdots')
  require('telescope').load_extension('project_files')
end

function config.autopairs()
  local autopairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')

  autopairs.setup()

  autopairs.add_rules {
    Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),
    Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),
    Rule('[ ', ' ]')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end)
    :use_key(']')
  }

  require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = false,  -- auto select first item
    map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
end

return config
