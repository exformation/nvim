-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`
-- TODO: explore telescope extensions (file browsers, gh, etc.)
require('telescope').setup {
  defaults = {
    prompt_prefix = 'test$ ',
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
  },
  pickers = {
    -- Do this for everything single thing???
    find_files = {
      theme = 'dropdown',
    },
  },
  -- extensions = {}
}
pcall(require('telescope').load_extension, 'fzf')
