" Disable 'Switch to Ex mode' mapping
nnoremap Q <Nop>

" Disable highlight search
nnoremap <Esc> <Cmd>noh<Cr>

"  Window navigation
nnoremap <silent><C-h> :wincmd h<cr>
nnoremap <silent><C-j> :wincmd j<cr>
nnoremap <silent><C-k> :wincmd k<cr>
nnoremap <silent><C-l> :wincmd l<cr>

nnoremap <leader>e :e<Space>
nnoremap <leader>v :vsplit<Space>

nnoremap <leader>w  <cmd>w<cr>
nnoremap <leader>q  <cmd>q<cr>
nnoremap <leader>fq <cmd>qa<cr>
nnoremap du 0D

noremap  <leader>s :s/
nnoremap <leader>S :%s/

" Indent the whole file
nnoremap <silent>=f gg=G

" Quick fix mappings
nnoremap <leader>co <cmd>copen<cr>
nnoremap <leader>cc <cmd>cclose<cr>
nnoremap <leader>cn <cmd>cnext<cr>
nnoremap <leader>cp <cmd>cprevious<cr>

" Select pasted text
nnoremap gp `[v`]

" Stay in indent mode
vnoremap <silent>> >gv
vnoremap <silent>< <gv

" Moving lines
nnoremap <silent><A-j> :move .+1<CR>==
nnoremap <silent><A-k> :move .-2<CR>==

vnoremap <silent><A-k> :m .+1<CR>==
vnoremap <silent><A-k> :m .-2<CR>==

xnoremap <silent><A-j> :move '>+1<CR>gv-gv
xnoremap <silent><A-k> :move '<-2<CR>gv-gv

vnoremap <silent>p "_dP

" Sort lines based on their length
xnoremap <leader><leader>sl :!awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Better terminal navigation
tnoremap <silent><C-h> <C-\><C-n><C-w>h
tnoremap <silent><C-j> <C-\><C-n><C-w>j
tnoremap <silent><C-k> <C-\><C-n><C-w>k
tnoremap <silent><C-l> <C-\><C-n><C-w>l

" Telescope mappings
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
