local hi_words = require('mini.extra').gen_highlighter.words

require('mini.hipatterns').setup {
  highlighters = {
    fixme = hi_words({ 'FIXME' }, 'MiniHipatternsFixme'),
    xxx = hi_words({ 'XXX' }, 'MiniHipatternsFixme'),
    hack = hi_words({ 'HACK' }, 'MiniHipatternsHack'),
    todo = hi_words({ 'TODO' }, 'MiniHipatternsTodo'),
    note = hi_words({ 'NOTE' }, 'MiniHipatternsNote'),
  },
}
