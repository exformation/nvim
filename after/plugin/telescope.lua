-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`
require('telescope').setup {
  defaults = {
    prompt_prefix = 'test$ ',
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')
