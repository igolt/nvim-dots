require('todo-comments').setup {
  signs = true,
  keywords = {
    TODO = { icon = ' ', color = 'info' },
    REFACTOR = { color = 'hint', icon = '' },
  },
  merge_keywords = true,

  highlight = {
    keyword = 'bg',
    pattern = [[.*<(KEYWORDS)(\(\S+\))?:]],
  },

  search = { pattern = [[\b(KEYWORDS)(\(\S+\))?:]] },
}
