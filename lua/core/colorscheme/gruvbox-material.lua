local cmd = vim.cmd

local function fg_bg(group, fgcol, bgcol)
  cmd('hi ' .. group .. ' guifg=' .. fgcol .. ' guibg=' .. bgcol)
end

local function fg(group, col)
  cmd('hi ' .. group .. ' guifg=' .. col)
end

local function bg(group, col)
  cmd('hi ' .. group .. ' guibg=' .. col)
end

vim.g.gruvbox_material_show_eob = 0
vim.g.gruvbox_material_sign_column_background = 'none'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

local darker_black = '#202020'
local black2 = '#32302f'
local black = '#282828'
local white = '#d4be98'
local red = '#ea6962'
local green = '#a9b665'

vim.cmd.colorscheme('gruvbox-material')

-- Telescope
fg_bg('TelescopeBorder', darker_black, darker_black)
fg_bg('TelescopePromptBorder', black2, black2)

fg_bg('TelescopePromptNormal', white, black2)
fg_bg('TelescopePromptPrefix', red, black2)

bg('TelescopeNormal', darker_black)

fg_bg('TelescopePreviewTitle', black, green)
fg_bg('TelescopePromptTitle', black, red)
fg_bg('TelescopeResultsTitle', darker_black, darker_black)

bg('TelescopeSelection', black2)

-- Fidget
fg('FidgetTask', white)

-- Floating windows
bg('NormalFloat', black)
