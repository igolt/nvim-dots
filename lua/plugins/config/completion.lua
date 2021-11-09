local cmp = require('cmp')

require('packer').loader('lspkind-nvim')

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
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    ['<C-e>'] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
    ['<CR>'] = cmp.mapping.confirm({select = false})
  },

  sources = cmp.config.sources({
    {name = 'calc'},
    {name = 'path'},
    {name = 'vsnip'},
    {name = 'nvim_lsp'},
  }, {
    {name = 'buffer'},
  }),

  formatting = {
    format = require('lspkind').cmp_format()
  }
}
