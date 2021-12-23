local remap = vim.api.nvim_set_keymap;

remap('n', 'ga', ':EasyAlign<cr>', {noremap = true})
remap('x', 'ga', ':EasyAlign<cr>', {noremap = true})
