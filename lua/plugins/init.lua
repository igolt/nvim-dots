---@param plugin string
local function pconfig(plugin)
  return function() require('plugins.config.' .. plugin) end
end

---@type LazySpec
return {
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  { 'kyazdani42/nvim-web-devicons', opts = {} },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = pconfig('autopairs'),
  },
  { 'RRethy/nvim-treesitter-endwise' },

  -- Language Features
  { 'williamboman/mason.nvim', opts = {} },
  { 'neovim/nvim-lspconfig', config = pconfig('lspconfig') },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        cpp = { lsp_format = 'fallback' },
        lua = { 'stylua' },
        python = { 'ruff', 'ruff_format' },
        javascript = { 'prettierd' },
        vue = { 'prettierd' },
        ['_'] = { 'trim_whitespace' },
      },

      format_after_save = true,
    },
  },
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    config = pconfig('cmp'),
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        config = pconfig('luasnip'),
      },
    },
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    config = pconfig('telescope'),
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
  { 'folke/todo-comments.nvim', config = pconfig('todo-comments') },

  -- UI
  {
    'stevearc/dressing.nvim',
    opts = { input = { mappings = { n = { ['ZZ'] = 'Confirm' } } } },
  },
  {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end,
  },

  -- colorschemes
  'folke/tokyonight.nvim',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = { scope = { enabled = false }, indent = { tab_char = '▎' } },
  },

  { 'feline-nvim/feline.nvim', config = pconfig('feline') },

  { 'kyazdani42/nvim-tree.lua', config = pconfig('nvim-tree') },
  { 'akinsho/nvim-bufferline.lua', config = pconfig('bufferline') },

  -- Editor plugins
  { 'nmac427/guess-indent.nvim', opts = {} },
  'godlygeek/tabular',
  { 'junegunn/vim-easy-align' },

  { 'vim-scripts/BufOnly.vim', cmd = 'BufOnly' },
  { 'akinsho/nvim-toggleterm.lua', config = pconfig('toggleterm') },

  'jghauser/mkdir.nvim',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'gpanders/editorconfig.nvim',

  {
    'xiyaowong/link-visitor.nvim',
    opts = {},
  },

  {
    'andymass/vim-matchup',
    init = function() vim.g.matchup_matchparen_offscreen = { method = 'popup' } end,
  },

  -- Git
  'tpope/vim-fugitive',
  { 'lewis6991/gitsigns.nvim', config = pconfig('gitsigns') },
  { 'f-person/git-blame.nvim', opts = { enabled = true } },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = pconfig('treesitter'),
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  -- spell for brazilian portuguese
  'mateusbraga/vim-spell-pt-br',
}
