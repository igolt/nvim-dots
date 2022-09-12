local default_opts = { noremap = true, silent = true }

local function set_keymap(mode, lhs, rhs, opts)
  opts = opts or default_opts
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function buf_set_keymap(buffer, mode, lhs, rhs, opts)
  opts = opts or { noremap = true, silent = true }
  opts.buffer = buffer
  vim.keymap.set(mode, lhs, rhs, opts)
end

local mapleader = require('user.config').mapleader or ' '
local maplocalleader = require('user.config').maplocalleader or ' '

vim.g.mapleader = mapleader
vim.g.maplocalleader = maplocalleader

local noremap = { noremap = true }

set_keymap('', mapleader, '<Nop>')
set_keymap('', maplocalleader, '<Nop>')

-- Disable 'Switch to Ex mode' mapping
set_keymap('n', 'Q', '<Nop>')

-- Map CTRL-[ to ESC
set_keymap('n', '<C-[>', '<Esc>', { remap = true })

-- Disable highlight search
set_keymap('n', '<Esc>', '<Cmd>noh<Cr>')

-- Open URL under cursor
set_keymap('n', 'gx', '<cmd>VisitLinkUnderCursor<cr>')

--  Window navigation
set_keymap('n', '<C-h>', ':wincmd h<cr>')
set_keymap('n', '<C-j>', ':wincmd j<cr>')
set_keymap('n', '<C-k>', ':wincmd k<cr>')
set_keymap('n', '<C-l>', ':wincmd l<cr>')

set_keymap('n', '<leader>e', ':e<Space>', noremap)
set_keymap('n', '<leader>v', ':vsplit<Space>', noremap)

set_keymap('n', '<leader>w', '<cmd>w<cr>')
set_keymap('n', '<leader>q', '<cmd>q<cr>')
set_keymap('n', '<leader>fq', '<cmd>qa<cr>')
set_keymap('n', 'du', '0D')

set_keymap('', '<leader>s', ':s/', noremap)
set_keymap('n', '<leader>S', ':%s/', noremap)

-- Indent the whole file
set_keymap('n', '=f', 'gg=G')

-- Quick fix mappings
set_keymap('n', '<leader>co', '<cmd>copen<cr>')
set_keymap('n', '<leader>cc', '<cmd>cclose<cr>')
set_keymap('n', '<leader>cn', '<cmd>cnext<cr>')
set_keymap('n', '<leader>cp', '<cmd>cprevious<cr>')

-- Select pasted text
set_keymap('n', 'gp', '`[v`]')

-- Stay in indent mode
set_keymap('v', '>', '>gv')
set_keymap('v', '<', '<gv')

-- Moving lines
set_keymap('n', '<A-j>', ':move .+1<CR>==')
set_keymap('n', '<A-k>', ':move .-2<CR>==')

set_keymap('v', '<A-k>', ':m .+1<CR>==')
set_keymap('v', '<A-k>', ':m .-2<CR>==')

set_keymap('x', '<A-j>', ":move '>+1<CR>gv-gv")
set_keymap('x', '<A-k>', ":move '<-2<CR>gv-gv")

set_keymap('x', 'p', '"_dP')

-- Sort lines based on their length
set_keymap(
  'x',
  '<leader><leader>sl',
  [[:!awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'<cr>]]
)

-- Better terminal navigation
set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h')
set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j')
set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k')
set_keymap('t', '<s-C-l>', '<C-\\><C-n><C-w>l')

-- Telescope mappings
set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>td', '<cmd>Telescope vimdots<cr>')
set_keymap('n', '<leader>tl', '<cmd>Telescope live_grep<cr>')

-- Buffers
set_keymap('n', '<Tab>', ':bnext<cr>')
set_keymap('n', '<S-Tab>', ':bprevious<cr>')
set_keymap('n', '<leader>x', '<cmd>bdelete<cr>')
set_keymap('n', '<leader>X', '<cmd>BufOnly<cr>')
set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- NvimTree
set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
set_keymap('n', '\\', '<cmd>NvimTreeFocus<cr>')

set_keymap('n', '<leader>gs', '<cmd>vertical G<cr>')

-- ZenMode
set_keymap('n', '<leader>zm', '<cmd>ZenMode<cr>')

-- Packer
set_keymap('n', '<leader>ps', '<cmd>PackerSync<cr>')
set_keymap('n', '<leader>pc', '<cmd>PackerCompile<cr>')

return {
  set_keymap = set_keymap,
  buf_set_keymap = buf_set_keymap,
}
