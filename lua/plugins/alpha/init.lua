vim.cmd [[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]

require('alpha').setup(require('alpha.themes.startify').opts)
