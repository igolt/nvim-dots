local data_dir = require('core.global').data_dir

local packer_dir = data_dir .. '/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(packer_dir)) > 0 then
  packer_bootstrap = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    packer_dir
  }
  vim.notify('Installing packer...')
  vim.cmd [[packadd packer.nvim]]
end

local ok, packer = pcall(require, 'packer')

if not ok then
  Warn("Could not load packer")
  return
end

packer.init {
  git     = {clone_timeout = 120},
  display = {
    open_fn = function ()
      return require('packer.util').float { border = 'rounded' }
    end
  }
}

packer.startup(function (use)
  local load_config = require('plugins.utils').load_config
  use 'wbthomason/packer.nvim'

  -- Essential plugins
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Completion
  use {
    'neovim/nvim-lspconfig',
    event  = 'BufReadPre',
    config = load_config('lspconfig')
  }

  use {
    'hrsh7th/nvim-cmp',
    after  = 'nvim-lspconfig',
    event  = 'InsertEnter',
    config = load_config('completion'),
  }

  use {
    'hrsh7th/vim-vsnip',
    after  = 'nvim-cmp',
    config = load_config('vsnip')
  }

  use {
    'onsails/lspkind-nvim',
    after  = 'nvim-cmp',
    config = load_config('lspkind')
  }

  use {'hrsh7th/cmp-calc'    , after = 'nvim-cmp'}
  use {'hrsh7th/cmp-path'    , after = 'nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'   , after = 'nvim-cmp'}
  use {'hrsh7th/cmp-buffer'  , after = 'nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}

  use { 'windwp/nvim-autopairs',
    after  = 'nvim-cmp',
    config = load_config('autopairs')
  }

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use {
    'nvim-telescope/telescope.nvim',
    cmd      = 'Telescope',
    config   = load_config('telescope'),
    requires = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        opt = true
      }
    }
  }

  -- UI
  use 'rcarriga/nvim-notify'

  use 'sainnhe/gruvbox-material'

  use {'glepnir/dashboard-nvim', config = load_config('dashboard')}

  use {
    'lewis6991/gitsigns.nvim' ,
    event  = {'BufRead','BufNewFile'},
    config = load_config('gitsigns'),
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event  = 'BufRead',
    config = load_config('indent_blankline')
  }

  use {'nvim-lualine/lualine.nvim'  , config = load_config('lualine')}
  use {'kyazdani42/nvim-tree.lua'   , config = load_config('nvim-tree')}
  use {'norcalli/nvim-colorizer.lua', config = load_config('colorizer')}
  use {'akinsho/nvim-bufferline.lua', config = load_config('bufferline')}

  -- Editor plugins
  use {
    'itchyny/vim-cursorword',
    event  = {'BufReadPre','BufNewFile'},
    config = load_config('cursorword')
  }

  use {'junegunn/vim-easy-align', config = load_config('easy_align')}

  use 'tpope/vim-repeat'
  use 'godlygeek/tabular'
  use {'folke/zen-mode.nvim'          , cmd    = 'ZenMode'}
  use {'numToStr/BufOnly.nvim'        , cmd    = 'BufOnly'}
  use {'tpope/vim-surround'           , event  = 'BufRead'}
  use {'tpope/vim-commentary'         , event  = 'BufRead'}
  use {'editorconfig/editorconfig-vim', event  = 'BufRead'}
  use {'akinsho/nvim-toggleterm.lua'  , config = load_config('toggleterm')}

  use {
    'andymass/vim-matchup',
    event  = 'BufEnter',
    config = load_config('matchup')
  }

  -- tools
  use 'tpope/vim-fugitive'

  use {
    'iamcco/markdown-preview.nvim',
    ft     = 'markdown',
    run    = 'cd app && npm install',
    config = [[vim.g.mkdp_auto_start = 0]]
  }

  use {
    'windwp/nvim-ts-autotag',
    after  = 'nvim-treesitter',
    config = [[require('nvim-ts-autotag').setup()]]
  }

  -- lang
  use 'lervag/vimtex'
  use 'tranvansang/octave.vim'
  use 'pantharshit00/vim-prisma'

  use {
    'nvim-treesitter/nvim-treesitter',
    run    = ':TSUpdate',
    event  = 'BufEnter',
    config = load_config('treesitter'),
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
end)

-- set some nice mappings
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}

keymap('n' , '<leader>ps' , '<cmd>PackerSync<cr>'    , opts)
keymap('n' , '<leader>pc' , '<cmd>PackerCompile<cr>' , opts)

if packer_bootstrap then packer.sync() end
