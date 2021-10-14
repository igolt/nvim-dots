" -- Windows
nnoremap <silent><C-h> :wincmd h<cr>
nnoremap <silent><C-j> :wincmd j<cr>
nnoremap <silent><C-k> :wincmd k<cr>
nnoremap <silent><C-l> :wincmd l<cr>

nnoremap Q <Nop>

nnoremap gp `[v`]

nnoremap <Esc> <Cmd>noh<Cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>FQ <cmd>qa<cr>
nnoremap du 0D
nnoremap Y y$

nnoremap <leader>e :e 
nnoremap <leader>v :vsplit 

noremap <leader>s :s/
nnoremap <leader>S :%s/

nnoremap <silent>=f gg=G

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>td <cmd>Telescope vimdots<cr>

" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprevious<cr>
nnoremap <leader>b  <cmd>BufferLinePick<cr>
nnoremap <leader>x  <cmd>bdelete<cr>
nnoremap <leader>X  <cmd>BufOnly<cr>

nnoremap <C-n> <cmd>NvimTreeToggle<cr>

nnoremap <leader>gs <cmd>vertical G<cr>

" ZenMode
nnoremap <leader>zm <cmd>ZenMode<cr>
