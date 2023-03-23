require('todo-comments').setup()
require('persistence').setup()
require('better_escape').setup {
  mapping = { 'jk' },
  timeout = 100,
}
require("persistence").load()
