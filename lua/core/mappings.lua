local keymap         = vim.api.nvim_set_keymap
local noremap        = {noremap = true}
local opts           = {noremap = true, silent = true}
local mapleader      = require('user.config').mapleader      or ' '
local maplocalleader = require('user.config').maplocalleader or ' '

vim.g.mapleader      = mapleader
vim.g.maplocalleader = maplocalleader

keymap("", mapleader     , "<Nop>", opts)
keymap("", maplocalleader, "<Nop>", opts)

-- Disable 'Switch to Ex mode' mapping
keymap("n", "Q", "<Nop>", opts)

-- Disable highlight search
keymap("n", "<Esc>", "<Cmd>noh<Cr>", opts)

--  Window navigation
keymap("n", "<C-h>", ":wincmd h<cr>", opts)
keymap("n", "<C-j>", ":wincmd j<cr>", opts)
keymap("n", "<C-k>", ":wincmd k<cr>", opts)
keymap("n", "<C-l>", ":wincmd l<cr>", opts)

keymap("n", "<leader>e", ":e<Space>"     , noremap)
keymap("n", "<leader>v", ":vsplit<Space>", noremap)

keymap("n", "<leader>w" , "<cmd>w<cr>" , opts)
keymap("n", "<leader>q" , "<cmd>q<cr>" , opts)
keymap("n", "<leader>fq", "<cmd>qa<cr>", opts)
keymap("n", "du"        , "0D"         , opts)

keymap("" , "<leader>s", ":s/" , noremap)
keymap("n", "<leader>S", ":%s/", noremap)

-- Indent the whole file
keymap("n", "=f", "gg=G", opts)

-- Quick fix mappings
keymap("n", "<leader>co", "<cmd>copen<cr>"    , opts)
keymap("n", "<leader>cc", "<cmd>cclose<cr>"   , opts)
keymap("n", "<leader>cn", "<cmd>cnext<cr>"    , opts)
keymap("n", "<leader>cp", "<cmd>cprevious<cr>", opts)

-- Select pasted text
keymap("n", "gp", "`[v`]", opts)

-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Moving lines
keymap("n", "<A-j>", ":move .+1<CR>==", opts)
keymap("n", "<A-k>", ":move .-2<CR>==", opts)

keymap("v", "<A-k>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("v", "p", '"_dP', opts)

-- Sort lines based on their length
keymap("x", "<leader><leader>sl", [[:!awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }'<cr>]], opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<s-C-l>", "<C-\\><C-n><C-w>l", opts)

-- Telescope mappings
keymap("n", "<C-p>"     , "<cmd>Telescope find_files<cr>" , opts)
keymap("n", "<leader>td", "<cmd>Telescope vimdots<cr>"    , opts)
keymap("n", "<leader>tl", "<cmd>Telescope live_grep<cr>"  , opts)

-- Buffers
keymap("n", "]b"       , ":bnext<cr>"             , opts)
keymap("n", "[b"       , ":bprevious<cr>"         , opts)
keymap("n", "<leader>x", "<cmd>bdelete<cr>"       , opts)
keymap("n", "<leader>X", "<cmd>BufOnly<cr>"       , opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

keymap("n", "<leader>gs", "<cmd>vertical G<cr>", opts)

-- ZenMode
keymap("n", "<leader>zm", "<cmd>ZenMode<cr>", opts)

-- Packer
keymap('n' , '<leader>ps' , '<cmd>PackerSync<cr>'    , opts)
keymap('n' , '<leader>pc' , '<cmd>PackerCompile<cr>' , opts)
