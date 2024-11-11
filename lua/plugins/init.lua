---@param plugin string
local function pconfig(plugin)
  return function() require('plugins.config.' .. plugin) end
end

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
        lua = { 'stylua' },
        python = { 'ruff', 'ruff_format' },
      },

      format_after_save = {
        lsp_format = 'fallback',
      },
    },
  },
  -- Completion
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  -- Snippets
  { 'hrsh7th/vim-vsnip', config = pconfig('vsnip') },

  { 'hrsh7th/nvim-cmp', config = pconfig('completion') },

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
  { 'stevearc/dressing.nvim', opts = {} },
  {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end,
  },

  -- colorschemes
  'folke/tokyonight.nvim',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = { scope = { enabled = false } },
  },

  { 'feline-nvim/feline.nvim', config = pconfig('feline') },

  { 'kyazdani42/nvim-tree.lua', config = pconfig('nvim-tree') },
  {
    'uga-rosa/ccc.nvim',
    opts = { highlighter = { auto_enable = true, lsp = true } },
  },
  { 'akinsho/nvim-bufferline.lua', config = pconfig('bufferline') },

  -- Editor plugins
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
