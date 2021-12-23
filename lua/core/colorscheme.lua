if not vim.g.colorscheme then return end

local colorscheme_configs = {
  ['gruvbox-material'] = function ()
      vim.g.gruvbox_material_show_eob                = 0
      vim.g.gruvbox_material_sign_column_background  = 'none'
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
  end
}

local config = colorscheme_configs[vim.g.colorscheme]

if config then config() end

local ok, _ = pcall(vim.cmd, 'colorscheme ' .. vim.g.colorscheme)
if not ok then
  Warn(('Could not load colorscheme `%s`'):format(vim.g.colorscheme))
end
