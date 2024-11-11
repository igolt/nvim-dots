local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

---@param opening string
---@param closing string
local function with_space_between(opening, closing)
  local cws = closing:match('^%s*(.-)%s*$')
  local match = '.%' .. cws
  return Rule(opening, closing)
    :with_pair(function() return false end)
    :with_del(function() return false end)
    :with_move(function(opts) return opts.prev_char:match(match) ~= nil end)
    :use_key(cws)
end

autopairs.setup()
autopairs.add_rules {
  Rule(' ', ' '):with_pair(function(opts)
    local pair = opts.line:sub(opts.col - 1, opts.col)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end),
  with_space_between('( ', ' )'),
  with_space_between('{ ', ' }'),
  with_space_between('[ ', ' ]'),
}
