-- require('todo-comments').setup() # why are they already highlighted?
require('Comment').setup()
require('persistence').setup()
require('better_escape').setup {
  mapping = { 'jk' },
  timeout = 100,
}
-- require("chatgpt").setup {
--   api_key_cmd = "gpg --decrypt ~/OPENAI.txt.gpg 2>/dev/null"
-- }
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})




require('onedark').load()
require('persistence').load()
