local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')


autopairs.setup()
autopairs.add_rules {
  Rule(' ', ' '):with_pair(function(opts)
    local pair = opts.line:sub(opts.col - 1, opts.col)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end),
}
