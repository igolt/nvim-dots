local data_dir = require('core.global').data_dir
local uv = vim.loop

local plugins = {}

function plugins.ensure_plugins()
  local packer_dir = data_dir .. '/pack/packer/opt/packer.nvim'
  local state = uv.fs_stat(packer_dir)

  if not state then
    vim.api.nvim_command(
    "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
    )
    uv.fs_mkdir(data_dir .. '/lua', 511, function()
      assert("make compile path dir faield")
    end)
  end
end

function plugins.setup()
  vim.api.nvim_command('packadd packer.nvim')
  local packer = require('packer')

  packer.init {
    git     = {clone_timeout = 120},
    display = {open_fn = require('packer.util').float}
  }

  packer.startup(function (use)
    local load_config = require('plugins.utils').load_config
    use {"wbthomason/packer.nvim", opt = true}

    -- Completion
    use {
      'neovim/nvim-lspconfig',
      event = 'BufReadPre',
      config = load_config('lspconfig')
    }

    use {
      'hrsh7th/nvim-cmp',
      after = 'nvim-lspconfig',
      event = 'InsertEnter',
      config = load_config('completion'),
    }

    use {
      'hrsh7th/vim-vsnip',
      after = 'nvim-cmp',
      config = load_config('vsnip')
    }

    use {
      'onsails/lspkind-nvim',
      after = 'nvim-cmp',
      config = load_config('lspkind')
    }

    use {'hrsh7th/cmp-calc', after = 'nvim-cmp'}
    use {'hrsh7th/cmp-path', after = 'nvim-cmp'}
    use {'hrsh7th/cmp-vsnip', after = 'nvim-cmp'}
    use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'}

    use {
      'windwp/nvim-autopairs',
      after = 'nvim-cmp',
      config = load_config('autopairs')
    }

    use {'jose-elias-alvarez/null-ls.nvim'}
    use {'jose-elias-alvarez/nvim-lsp-ts-utils'}

    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      config = load_config('telescope'),
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-lua/popup.nvim', opt = true},
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',
          opt = true
        },
      }
    }

    -- UI
    use {'rcarriga/nvim-notify'}

    use {
      'sainnhe/gruvbox-material',
      config = function ()
        vim.g.gruvbox_material_show_eob = 0
        vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
        vim.g.gruvbox_material_sign_column_background = 'none'
        vim.cmd [[colorscheme gruvbox-material]]
      end
    }

    use {
      'glepnir/dashboard-nvim',
      config = load_config('dashboard')
    }

    use {
      'lewis6991/gitsigns.nvim' ,
      event = {'BufRead','BufNewFile'},
      config = load_config('gitsigns'),
      requires = {'nvim-lua/plenary.nvim'}
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufRead',
      config = load_config('indent_blankline')
    }

    use {
      'nvim-lualine/lualine.nvim',
      config = load_config('lualine'),
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }

    use {
      'kyazdani42/nvim-tree.lua',
      config = load_config('nvim_tree'),
      requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
      'akinsho/nvim-bufferline.lua',
      config = load_config('bufferline'),
      requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
      'norcalli/nvim-colorizer.lua',
      config = load_config('colorizer')
    }

    -- Editor plugins
    use {
      'itchyny/vim-cursorword',
      event = {'BufReadPre','BufNewFile'},
      config = load_config('cursorword')
    }

    use {
      'junegunn/vim-easy-align',
      event = 'BufRead',
      config = load_config('easy_align')
    }

    use 'tpope/vim-repeat'
    use 'godlygeek/tabular'
    use {'folke/zen-mode.nvim', cmd = 'ZenMode'}
    use {'tpope/vim-surround', event = 'BufRead'}
    use {'numToStr/BufOnly.nvim', cmd = 'BufOnly'}
    use {'tpope/vim-commentary', event = 'BufRead'}
    use {'editorconfig/editorconfig-vim', event = 'BufRead'}
    use {'akinsho/nvim-toggleterm.lua', config = load_config('toggleterm')}

    use {
      'andymass/vim-matchup',
      event = 'BufEnter',
      config = load_config('matchup')
    }

    -- tools
    use {'tpope/vim-fugitive'}

    use {
      'iamcco/markdown-preview.nvim',
      ft = 'markdown',
      run = 'cd app && npm install',
      config = [[vim.g.mkdp_auto_start = 0]]
    }

    use {
      'windwp/nvim-ts-autotag',
      after = 'nvim-treesitter',
      config = function ()
        require('nvim-ts-autotag').setup()
      end
    }

    -- lang
    use {'lervag/vimtex'}
    use {'tranvansang/octave.vim'}

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'BufEnter',
      config = load_config('treesitter'),
    }

    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter'
    }

    use  {
      'pantharshit00/vim-prisma'
    }
  end)

  -- set some nice mappings
  local keymap = vim.api.nvim_set_keymap
  local opts = {noremap = true}

  keymap('n', '<leader>ps', '<cmd>PackerSync<cr>', opts)
  keymap('n', '<leader>pc', '<cmd>PackerCompile<cr>', opts)
end

return plugins
