local data_dir = require('core.global').data_dir
local local_plugins_dir = require('core.global').local_plugins_dir

local packer_dir = data_dir .. '/pack/packer/start/packer.nvim'
local packer_augroup = 'PackerUserConfig'
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(packer_dir)) > 0 then
  vim.notify('Installing packer...')

  packer_bootstrap = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_dir,
  }

  vim.cmd('packadd packer.nvim')
end

local packer_loaded, packer = pcall(require, 'packer')
if not packer_loaded then
  Warn('Could not load packer')
  return
end

packer.init {
  git = { clone_timeout = 120 },
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

vim.api.nvim_create_augroup(packer_augroup, {})
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerSync',
  group = packer_augroup,
})

local function load_config(config)
  local modname = 'plugins.' .. config

  return string.format(
    [[
      local ok, _ = pcall(require, '%s')

      if not ok then Warn("Failed loading config file for: '%s'") end
    ]],
    modname,
    config
  )
end

packer.startup(function(use)
  -- Essential plugins
  use('wbthomason/packer.nvim')
  use('nvim-lua/plenary.nvim')
  use('nvim-lua/popup.nvim')
  use { 'kyazdani42/nvim-web-devicons', config = load_config('devicons') }

  -- Completion
  use('hrsh7th/cmp-calc')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-nvim-lsp')

  use { 'hrsh7th/nvim-cmp', config = load_config('completion') }

  -- Snippets
  use { 'hrsh7th/vim-vsnip', config = load_config('vsnip') }

  -- Autopairs
  use { 'windwp/nvim-autopairs', config = load_config('autopairs') }

  -- LSP
  use { 'neovim/nvim-lspconfig', config = load_config('lspconfig') }
  use('jose-elias-alvarez/null-ls.nvim')
  use('jose-elias-alvarez/nvim-lsp-ts-utils')

  use {
    'nvim-telescope/telescope.nvim',
    config = load_config('telescope'),
    cmd = 'Telescope',
    module = 'telescope',
    requires = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        opt = true,
      },
    },
  }

  -- UI
  use {
    'stevearc/dressing.nvim',
    config = load_config('dressing'),
    -- after = 'telescope.nvim',
  }
  use('rcarriga/nvim-notify')
  use {
    'goolord/alpha-nvim',
    config = load_config('alpha'),
  }
  use { 'folke/todo-comments.nvim', config = load_config('todo-comments') }

  -- colorschemes
  use('folke/tokyonight.nvim')
  use('LunarVim/Colorschemes')
  use('Mofiqul/dracula.nvim')
  use('sainnhe/gruvbox-material')
  use(local_plugins_dir .. '/gruvbox-material.nvim')

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = load_config('indent_blankline'),
  }

  use { 'feline-nvim/feline.nvim', config = load_config('feline') }

  use { 'kyazdani42/nvim-tree.lua', config = load_config('nvim-tree') }
  use { 'norcalli/nvim-colorizer.lua', config = load_config('colorizer') }
  use { 'akinsho/nvim-bufferline.lua', config = load_config('bufferline') }

  -- Editor plugins
  use('godlygeek/tabular')
  use { 'junegunn/vim-easy-align', config = load_config('easy_align') }

  use { 'folke/zen-mode.nvim', cmd = 'ZenMode' }
  use { 'vim-scripts/BufOnly.vim', cmd = 'BufOnly' }
  use { 'akinsho/nvim-toggleterm.lua', config = load_config('toggleterm') }

  use('jghauser/mkdir.nvim')
  use('tpope/vim-repeat')
  use('tpope/vim-surround')
  use('tpope/vim-commentary')
  use('gpanders/editorconfig.nvim')

  use {
    'xiyaowong/link-visitor.nvim',
    config = [[require('link-visitor').setup()]],
  }

  use {
    'andymass/vim-matchup',
    config = [[vim.g.matchup_matchparen_offscreen = { method = 'popup' }]],
  }

  -- Git
  use('tpope/vim-fugitive')
  use {
    'lewis6991/gitsigns.nvim',
    config = load_config('gitsigns'),
  }

  -- filetype plugins
  use('lervag/vimtex')
  use('tranvansang/octave.vim')
  use('pantharshit00/vim-prisma')
  use { 'Fymyte/rasi.vim', ft = 'rasi' }

  use {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    run = 'cd app && yarn install',
    config = load_config('markdown-preview'),
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = load_config('treesitter'),
  }
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use('nvim-treesitter/playground')
  use {
    'windwp/nvim-ts-autotag',
    config = "require('nvim-ts-autotag').setup()",
  }

  -- spell for brazilian portuguese
  use('mateusbraga/vim-spell-pt-br')
  -- fix cursor hold
  use { 'antoinemadec/FixCursorHold.nvim' }
end)

if packer_bootstrap then
  packer.sync()
end
