return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {},
          },
        },
      }
      require('telescope').load_extension 'ui-select'

      local as = require 'telescope.actions.state'
      local actions = require 'telescope.actions'

      -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua#L941
      local get_entries = function(bufnr)
        local manager = as.get_current_picker(bufnr).manager
        local entries = {}
        for entry in manager:iter() do
          table.insert(entries, entry)
        end
        return entries
      end

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = function(bufnr)
                local entries = get_entries(bufnr)
                print(vim.inspect(entries))
                actions.close(bufnr)
              end,
            },
          },
        },
      }
    end,
  },
}
