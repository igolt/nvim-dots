local cmd = vim.cmd

local fg = function (group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

local fg_bg = function (group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local bg = function (group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

vim.g.gruvbox_material_show_eob                = 0
vim.g.gruvbox_material_sign_column_background  = 'none'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

cmd [[colorscheme gruvbox-material]]

local darker_black = "#202020"
local black2 = "#32302f"
local black = "#282828"
local white = "#d4be98"
local red = "#ea6962"
local green = "#a9b665"

-- Telescope

fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)

fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)

bg("TelescopeNormal", darker_black)

fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)

bg("TelescopeSelection", black2)

-- NvimTree

fg("NvimTreeEndOfBuffer", darker_black)
-- fg("NvimTreeFolderIcon", folder_bg)
-- fg("NvimTreeFolderName", folder_bg)
-- fg("NvimTreeGitDirty", red)
-- fg("NvimTreeIndentMarker", one_bg2)
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
-- fg("NvimTreeOpenedFolderName", folder_bg)
-- fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
fg_bg("NvimTreeStatusLine", darker_black, darker_black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeVertSplit", darker_black, darker_black)

-- Floating windows
-- bg("NormalFloat", darker_black)
