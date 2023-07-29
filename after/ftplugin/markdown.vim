setlocal tabstop=4
setlocal textwidth=80
setlocal spell
setlocal tabstop=2
setlocal formatexpr=o " set to 'o' so it's not overridden by lsp.formatexpr

nnoremap <buffer><leader>rc <cmd>MarkdownPreview<cr>
nnoremap <buffer><silent>= gq
nnoremap <buffer><silent>== gql
