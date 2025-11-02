local mapleader = require('config').mapleader or ' '
local maplocalleader = require('config').maplocalleader or ' '
local noremap = { noremap = true }

vim.g.mapleader = mapleader
vim.g.maplocalleader = maplocalleader

-- Jump to the end of the line in insert mode
vim.keymap.set('i', '<C-l>', '<C-o>A')

-- Disable 'Switch to Ex mode' mapping
vim.keymap.set('n', 'Q', '<Nop>')

-- Disable highlight search
vim.keymap.set('n', '<Esc>', '<Cmd>noh<CR>')

-- Open URL under cursor
vim.keymap.set('n', 'gx', '<Cmd>VisitLinkUnderCursor<CR>')

-- Code runner
vim.keymap.set('n', '<leader>rc', '<Cmd>RunCode<CR>')

--  Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>e', ':e<Space>', noremap)
vim.keymap.set('n', '<leader>v', ':vsplit<Space>', noremap)

vim.keymap.set('n', '<leader>w', '<Cmd>silent w<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>')
vim.keymap.set('n', '<leader>fq', '<Cmd>qa<CR>')
vim.keymap.set('n', 'du', '0D')

vim.keymap.set('', '<leader>s', ':s/', noremap)
vim.keymap.set('n', '<leader>S', ':%s/', noremap)

-- Indent the whole file
vim.keymap.set('n', '=f', 'gg=G')

-- Quick fix mappings
vim.keymap.set('n', '<leader>co', '<Cmd>copen<CR>')
vim.keymap.set('n', '<leader>cc', '<Cmd>cclose<CR>')
vim.keymap.set('n', '<leader>cn', '<Cmd>cnext<CR>')
vim.keymap.set('n', '<leader>cp', '<Cmd>cprevious<CR>')

-- Select pasted text
vim.keymap.set('n', 'gp', '`[v`]')

-- Stay in indent mode
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Moving lines
vim.keymap.set('n', '<A-j>', '<Cmd>move .+1<CR>==')
vim.keymap.set('n', '<A-k>', '<Cmd>move .-2<CR>==')

vim.keymap.set('v', '<A-k>', '<Cmd>m .+1<CR>==')
vim.keymap.set('v', '<A-k>', '<Cmd>m .-2<CR>==')

vim.keymap.set('x', '<A-j>', "<Cmd>move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', "<Cmd>move '<-2<CR>gv-gv")

-- Don't replace register content when pasting
vim.keymap.set('x', 'p', '"_dP')

-- Sort lines based on their length
vim.keymap.set(
  'x',
  '<leader><leader>sl',
  [[:!awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'<CR>]],
  { silent = true }
)

-- Better terminal navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<s-C-l>', '<C-\\><C-n><C-w>l')

-- Telescope mappings
vim.keymap.set(
  'n',
  '<C-p>',
  '<Cmd>lua require("telescope.builtin").find_files({hidden=true})<CR>'
)
vim.keymap.set('n', '<leader>td', '<Cmd>Telescope vimdots<CR>')
vim.keymap.set('n', '<leader>tl', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>to', '<Cmd>TodoTelescope<CR>')

-- Buffers
vim.keymap.set('n', '<Tab>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>')
vim.keymap.set('n', '<leader>X', '<Cmd>BufOnly<CR>')
vim.keymap.set('n', '<leader>b', '<Cmd>Telescope buffers<CR>')

-- NvimTree
vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '\\', '<Cmd>NvimTreeFocus<CR>')

-- Git
vim.keymap.set('n', '<leader>gs', '<Cmd>vertical G<CR>')
vim.keymap.set('n', '<leader>gp', '<Cmd>GitPush<CR>')
vim.keymap.set('n', '<leader>gl', '<Cmd>GitPull<CR>')
vim.keymap.set('n', '<leader>gm', ':G merge<Space>')
vim.keymap.set('n', '<leader>gco', ':G checkout<Space>')
vim.keymap.set('n', '<leader>gcm', '<Cmd>G checkout main<CR>')
vim.keymap.set('n', '<leader>gcd', '<Cmd>G checkout development<CR>')
vim.keymap.set('n', 'gb', '<Cmd>GitBlameToggle<CR>')

-- EasyAlign
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')

-- unset LSP default mappings (nvim>=0.11)
if vim.fn.has('nvim-0.11') == 1 then
  vim.keymap.del('n', 'grr')
  vim.keymap.del({ 'n', 'v' }, 'gra')
  vim.keymap.del('n', 'grn')
  vim.keymap.del('n', 'gri')
  vim.keymap.del('n', 'gO')
  vim.keymap.del('i', '<C-s>')
end
