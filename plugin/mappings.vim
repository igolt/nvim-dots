" -- Windows
nnoremap <silent><C-h> :wincmd h<cr>
nnoremap <silent><C-j> :wincmd j<cr>
nnoremap <silent><C-k> :wincmd k<cr>
nnoremap <silent><C-l> :wincmd l<cr>

nnoremap Q <Nop>

nnoremap gp `[v`]

nnoremap <Esc> <Cmd>noh<Cr>
nnoremap <C-[> <Cmd>noh<Cr>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>fq <cmd>qa<cr>
nnoremap du 0D

nnoremap <leader>e :e 
nnoremap <leader>v :vsplit 

noremap <leader>s :s/
nnoremap <leader>S :%s/

nnoremap <silent>=f gg=G

xnoremap <leader><leader>sl :!awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Quick fix mappings
nnoremap <leader>co <cmd>copen<cr>
nnoremap <leader>cc <cmd>cclose<cr>
nnoremap <leader>cn <cmd>cnext<cr>
nnoremap <leader>cp <cmd>cprevious<cr>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>td <cmd>Telescope vimdots<cr>
nnoremap <leader>tl <cmd>Telescope live_grep<cr>

" Buffers
nnoremap <silent>]b :bnext<cr>
nnoremap <silent>[b :bprevious<cr>
nnoremap <leader>b  <cmd>BufferLinePick<cr>
nnoremap <leader>x  <cmd>bdelete<cr>
nnoremap <leader>X  <cmd>BufOnly<cr>

nnoremap <C-n> <cmd>NvimTreeToggle<cr>

nnoremap <leader>gs <cmd>vertical G<cr>

" ZenMode
nnoremap <leader>zm <cmd>ZenMode<cr>
