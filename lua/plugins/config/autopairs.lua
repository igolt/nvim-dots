local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

local function cond(opts)
  if vim.bo.filetype == 'markdown' then
    return false
  end
  local pair = opts.line:sub(opts.col - 1, opts.col)
  return vim.tbl_contains({ '()', '[]', '{}' }, pair)
end

autopairs.setup()
autopairs.add_rules {
  Rule(' ', ' '):with_pair(cond):with_del(cond),
}
