local conf = require('modules.ui.config')

local ui = {
  ['glepnir/dashboard-nvim'] = {config = conf.dashboard},

  ['norcalli/nvim-colorizer.lua'] = {
    config = conf.nvim_colorizer
  },

  ['lewis6991/gitsigns.nvim'] = {
    event = {'BufRead','BufNewFile'},
    config = conf.gitsigns,
    requires = {'nvim-lua/plenary.nvim', opt=true}
  },

  ['lukas-reineke/indent-blankline.nvim'] = {
    event = 'BufRead',
    config = conf.indent_blakline
  },

  ['hoob3rt/lualine.nvim'] = {
    config = conf.lualine,
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  },

  ['kyazdani42/nvim-tree.lua'] = {
    cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
    config = conf.nvim_tree,
    requires = 'kyazdani42/nvim-web-devicons'
  },

  ['onsails/lspkind-nvim'] = {
    requires = 'kyazdani42/nvim-web-devicons',
  },

  ['akinsho/nvim-bufferline.lua'] = {
    config = conf.nvim_bufferline,
    requires = 'kyazdani42/nvim-web-devicons'
  },
}

local colorscheme_list = {
  tokyonight = {
    git = 'folke/tokyonight.nvim',
    packer_config = {
      config = function ()
        vim.g.tokyonight_style = 'night'
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = {'qf', 'vista_kind', 'terminal', 'packer'}

        vim.g.tokyonight_colors = {hint = 'orange', error = "#ff0000"}

        vim.cmd [[colorscheme tokyonight]]
      end
    }
  },

  olimorris = {
    git = 'olimorris/onedark.nvim',
    packer_config = {
      config = [[require('onedark').load()]]
    };
  },

  gruvbox = {
    git = 'gruvbox-community/gruvbox',
    packer_config = {
      config = conf.gruvbox
    }
  },

  ['zephyr-nvim'] = {
    git = 'glepnir/zephyr-nvim',
    packer_config = {
      config = [[vim.cmd('colorscheme zephyr')]]
    }
  },

  ['gruvbox-material'] = {
    git = 'sainnhe/gruvbox-material',
    packer_config = {
      config = [[vim.cmd('colorscheme gruvbox-material')]]
    },
  },

  ['material.nvim'] = {
    git = 'marko-cerovac/material.nvim',
    packer_config = {
      config = conf.material_nvim
    }
  },

  ['vscode.nvim'] = {
    git = 'Mofiqul/vscode.nvim',
    packer_config = {
      config = function ()
        vim.g.vscode_style = 'dark'
        vim.cmd [[colorscheme vscode]]
      end
    }
  },

  ['omni.vim'] = {
    git = 'getomni/neovim',
    packer_config = {
      config = function ()
        vim.cmd [[colorscheme omni]]
      end
    }
  }
}

local function set_colorscheme(colorscheme)
  for cs, value in pairs(colorscheme_list) do
    local packer_config = value.packer_config

    packer_config.opt = cs ~= colorscheme
    ui[value.git] = packer_config
  end
end

set_colorscheme('gruvbox-material')

return ui
