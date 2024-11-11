---@param plugin_name string
local function load_config(plugin_name)
  return function() require('plugins.config.' .. plugin_name) end
end

return {
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  { 'kyazdani42/nvim-web-devicons', config = load_config('devicons') },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = load_config('autopairs'),
  },
  { 'RRethy/nvim-treesitter-endwise' },

  -- Language Features
  { 'williamboman/mason.nvim', config = load_config('mason') },
  { 'neovim/nvim-lspconfig', config = load_config('lspconfig') },
  { 'stevearc/conform.nvim', config = load_config('conform') },
  -- Completion
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  -- Snippets
  { 'hrsh7th/vim-vsnip', config = load_config('vsnip') },

  { 'hrsh7th/nvim-cmp', config = load_config('completion') },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    config = load_config('telescope'),
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
  { 'folke/todo-comments.nvim', config = load_config('todo-comments') },

  -- UI
  { 'stevearc/dressing.nvim', config = load_config('dressing') },
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

  { 'feline-nvim/feline.nvim', config = load_config('feline') },

  { 'kyazdani42/nvim-tree.lua', config = load_config('nvim-tree') },
  { 'uga-rosa/ccc.nvim', config = load_config('ccc') },
  { 'akinsho/nvim-bufferline.lua', config = load_config('bufferline') },

  -- Editor plugins
  'godlygeek/tabular',
  { 'junegunn/vim-easy-align', config = load_config('easy_align') },

  { 'vim-scripts/BufOnly.vim', cmd = 'BufOnly' },
  { 'akinsho/nvim-toggleterm.lua', config = load_config('toggleterm') },

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
    config = [[vim.g.matchup_matchparen_offscreen = { method = 'popup' }]],
  },

  -- Git
  'tpope/vim-fugitive',
  { 'lewis6991/gitsigns.nvim', config = load_config('gitsigns') },
  { 'f-person/git-blame.nvim', opts = { enabled = true } },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = 'cd app && yarn install',
    config = load_config('markdown-preview'),
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = load_config('treesitter'),
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },

  -- spell for brazilian portuguese
  'mateusbraga/vim-spell-pt-br',
}
