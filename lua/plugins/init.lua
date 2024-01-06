local function load_config(plugin_name)
  require('plugins.config.' .. plugin_name)
end

return {
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  { 'kyazdani42/nvim-web-devicons', config = function() load_config('devicons') end },

  -- Completion
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',

  { 'hrsh7th/nvim-cmp', config = function() load_config('completion') end },

  -- Snippets
  { 'hrsh7th/vim-vsnip', config = function() load_config('vsnip') end },

  -- Autopairs
  { 'windwp/nvim-autopairs', config = function() load_config('autopairs') end },

  -- LSP
  { 'williamboman/mason.nvim', config = function() load_config('mason') end },
  { 'neovim/nvim-lspconfig', config = function() load_config('lspconfig') end },
  'jose-elias-alvarez/null-ls.nvim',
  'jose-elias-alvarez/typescript.nvim',

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    config = function() load_config('telescope') end,
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },

  -- UI
  { 'stevearc/dressing.nvim', config = function() load_config('dressing') end },
  'rcarriga/nvim-notify',
  { 'goolord/alpha-nvim', config = function() load_config('alpha') end },
  { 'folke/todo-comments.nvim', config = function() load_config('todo-comments') end },

  -- colorschemes
  'projekt0n/github-nvim-theme',
  'lourenci/github-colors',
  'sainnhe/gruvbox-material',
  'folke/tokyonight.nvim',

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() load_config('indent_blankline') end,
  },

  { 'feline-nvim/feline.nvim', config = function() load_config('feline') end },

  { 'kyazdani42/nvim-tree.lua', config = function() load_config('nvim-tree') end },
  { 'uga-rosa/ccc.nvim', config = function() load_config('ccc') end },
  { 'akinsho/nvim-bufferline.lua', config = function() load_config('bufferline') end },

  -- Editor plugins
  'godlygeek/tabular',
  { 'junegunn/vim-easy-align', config = function() load_config('easy_align') end },

  { 'vim-scripts/BufOnly.vim', cmd = 'BufOnly' },
  { 'akinsho/nvim-toggleterm.lua', config = function() load_config('toggleterm') end },

  'jghauser/mkdir.nvim',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'gpanders/editorconfig.nvim',

  {
    'xiyaowong/link-visitor.nvim',
    config = function ()
      require('link-visitor').setup()
    end
  },

  {
    'andymass/vim-matchup',
    config = [[vim.g.matchup_matchparen_offscreen = { method = 'popup' }]],
  },

  -- Git
  'tpope/vim-fugitive',
  { 'lewis6991/gitsigns.nvim', config = function() load_config('gitsigns') end },
  { 'f-person/git-blame.nvim', config = function ()
    require('gitblame').setup{ enabled = true }
  end },

  -- filetype plugins
  'lervag/vimtex',
  'tranvansang/octave.vim',
  'pantharshit00/vim-prisma',
  { 'Fymyte/rasi.vim', ft = 'rasi' },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = 'cd app && yarn install',
    config = function() load_config('markdown-preview') end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() load_config('treesitter') end,
  },
  'JoosepAlviste/nvim-ts-context-commentstring',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/playground',
  {
    'windwp/nvim-ts-autotag',
    config = "require('nvim-ts-autotag').setup()",
  },

  -- spell for brazilian portuguese
  'mateusbraga/vim-spell-pt-br',

  { 'antoinemadec/FixCursorHold.nvim' },
}
