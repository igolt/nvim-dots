local colorscheme_configs = {
  ['gruvbox-material'] = function ()
      vim.g.gruvbox_material_show_eob                = 0
      vim.g.gruvbox_material_sign_column_background  = 'none'
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
  end,

  ['tokyonight'] = function ()
    vim.g.tokyonight_style               = 'night'
    vim.g.tokyonight_dark_sidebar        = false
    vim.g.tokyonight_transparent_sidebar = true
  end,

  ['vscode'] = function ()
    vim.g.vscode_style = "dark"
  end,

  ['material'] = function ()
    require('material').setup({
      contrast = {
        sidebars = true,
        -- line_numbers = true,
        -- cursor_line = true,
        -- non_current_windows = true,
        -- popup_menu = true,
      },

      italics = {
        comments = false, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false -- Enable italic variables
      },

      contrast_filetypes = {
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf" -- Darker qf list background
      },

    high_visibility = {
      lighter = false, -- Enable higher contrast text for lighter style
      darker = false -- Enable higher contrast text for darker style
    },

    disable = {
      borders = true, -- Disable borders between verticaly split windows
      background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
      term_colors = false,
      eob_lines = true
    },

    custom_highlights = {} -- Overwrite highlights with your own
  })
  end
}

local colorscheme = require('user.config').colorscheme
local config = nil

if type(colorscheme) == 'table' then
  colorscheme = colorscheme.name
  config      = colorscheme.config
else
  config      = colorscheme_configs[colorscheme]
end

if not colorscheme then return end
if config then config() end

local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  Warn(('Could not load colorscheme `%s`'):format(vim.g.colorscheme))
end
