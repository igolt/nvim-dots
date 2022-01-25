local color_name = vim.g.colors_name
if color_name then
  -- TODO(igolt): Set my own themes
end

-- fg and bg must have this much contrast range 0 < contrast_treshold < 0.5
local contrast_treshold = 0.3
-- how much brightnesss is changed in percentage for light and dark themes
local brightnesss_modifier_parameter = 10

-- turn #rrggbb -> { red, green, blue }
local function rgb_str2num(rgb_color_str)
  if rgb_color_str:find '#' == 1 then
    rgb_color_str = rgb_color_str:sub(2, #rgb_color_str)
  end
  local red   = tonumber(rgb_color_str:sub(1, 2), 16)
  local green = tonumber(rgb_color_str:sub(3, 4), 16)
  local blue  = tonumber(rgb_color_str:sub(5, 6), 16)
  return {red = red, green = green, blue = blue}
end

-- turns { red, green, blue } -> #rrggbb
local function rgb_num2str(rgb_color_num)
  return string.format('#%02x%02x%02x', rgb_str2num.red, rgb_str2num.green, rgb_str2num.blue)
end

-- return brightnesss level of color in range 0 to 1
-- arbitrary value it's basicaly an weighted average
local function get_color_brightness(rgb_color)
  local color = rgb_str2num(rgb_color)
  local brightnesss = (color.red * 2 + color.green * 3 + color.blue) / 6
  return brightnesss / 256
end

-- return average of colors in range 0 to 1
-- used to ditermine contrast level
local function get_color_avg(rgb_color)
  local color = rgb_str2num(rgb_color)
  return (color.red + color.green + color.blue) / 3 / 256
end

-- Changes brightnesss of foreground color to achieve contrast
-- without changing the color
local function apply_contrast(highlight)
  local highlight_bg_avg = get_color_avg(highlight.bg)
  local contrast_treshold_config = cl[]
end
