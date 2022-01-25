local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function (args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },

  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
    ['<CR>'] = cmp.mapping.confirm({select = false})
  },

  sources = {
    {name = 'nvim_lsp'},
    {name = 'vsnip'},
    {name = 'path'},
    {name = 'calc'},
    {name = 'buffer'},
  },

  formatting = {
    format = function(_, vim_item)
      vim_item.kind = string.format(' %s %s', kind_icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  }
}
