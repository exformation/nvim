return {
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        version = '^1.0.0',
      },
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local as = require 'telescope.actions.state'
      local actions = require 'telescope.actions'

      -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua#L941
      -- experimenting
      local get_entries = function(bufnr)
        local manager = as.get_current_picker(bufnr).manager
        local entries = {}
        for entry in manager:iter() do
          table.insert(entries, entry)
        end
        return entries
      end

      -- TODO: i can't make this work, that key isn't real
      local ignore_tests = true
      local function toggle_ignore_patterns(bufnr)
        local config = require('telescope.config').values
        P(vim.tbl_keys(config))
        if ignore_tests then
          config.file_ignore_patterns = { 'test', 'Test' }
        else
          config.file_ignore_patterns = {}
        end
        as.get_current_picker(bufnr):refresh()
        ignore_tests = not ignore_tests
      end

      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = actions.close,
              ['<c-j>'] = function(bufnr)
                local entries = get_entries(bufnr)
                print(vim.inspect(entries))
                actions.close(bufnr)
              end,
              ['<c-t>'] = toggle_ignore_patterns,
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {},
          },
        },
        pickers = {
          find_files = {
            -- find_command = { 'sh', '-c', "rg --files | xargs file --mime-type | grep 'text' | cut -d':' -f1" },
            -- find_command = { 'sh', '-c', "fd -t f -x file --mime-type {} | grep 'text/plain' | cut -d: -f1" },
            -- find_command = { 'sh', '-c', "rg '' --files-with-matches" },
          },
        },
      }
      require('telescope').load_extension 'ui-select'
    end,
  },
}

-- TODO: have a picker/action for opening links in a buffer
-- TODO: also just make a bind for opening links that you're on or near
--   links should be a text object and opening them should be a motion
-- TODO: look at the doom emacs picker for ideas
