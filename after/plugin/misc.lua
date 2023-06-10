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
-- TODO: create some of your own status indicators (LSP and such)
require('lualine').setup {
  options = { section_separators = '', component_separators = '' },
  globalstatus = true,
  sections = {
    lualine_a = {},
    lualine_b = { 'mode', 'branch', 'diagnostics', 'diff', 'selectioncount' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'buffers' },
  },
  extensions = { 'nvim-tree' }
}
require('nvim-surround').setup()
require('hop').setup {
  -- TODO: you can expand this when you start to use taipo again
  keys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", --",./1234567890;'",
}

require('onedark').load()
require('persistence').load()
