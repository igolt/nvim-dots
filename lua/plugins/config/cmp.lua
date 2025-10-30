local cmp = require('cmp')

cmp.setup {
  completion = {
    autocomplete = false,
  },

  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },

  mapping = cmp.mapping.preset.insert {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping(function(_)
      if cmp.visible() then
        cmp.select_next_item()
      else
        cmp.complete()
      end
    end),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-l>'] = cmp.mapping(function(fallback)
      if require('luasnip').expand_or_jumpable(-1) then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-h>'] = cmp.mapping(function(fallback)
      if require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },

  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'calc' },
    { name = 'buffer' },
  },
}
