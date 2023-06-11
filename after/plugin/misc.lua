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
-- local function hello()
--   return '<cmd>pwd<cr>'
-- end
require('lualine').setup {
  options = { section_separators = '', component_separators = '' },
  globalstatus = true,
  sections = {
    lualine_a = {},
    lualine_b = { 'mode', "vim.fn.fnamemodify(vim.fn.getcwd(), ':t:gs?%?/?:~:r')", 'branch', 'diagnostics', 'diff',
      'selectioncount' },
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
  keys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~",
  -- keys = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
}
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- disable = { 'jsx', 'cpp' },
    query = 'rainbow-parens',
    strategy = require('ts-rainbow').strategy.global,
  }
}

-- to execute the function
-- load_session()
-- telescope dir | silent! source


require('onedark').load()
require('persistence').load()


-- TODO: format buffer on save
-- TODO: autosave
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   buffer = buffer,
--   callback = function()
--     vim.lsp.buf.format { async = false }
--   end
-- })
