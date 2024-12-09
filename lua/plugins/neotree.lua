return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      use_float = false,
      filesystem = {
        follow_current_file = true,
      },
      event_handlers = {
        {
          event = 'after_render',
          handler = function()
            local state = require('neo-tree.sources.manager').get_state('filesystem')
            if not require('neo-tree.sources.common.preview').is_active() then
              state.config = { use_float = false } -- or whatever your config is
              state.commands.toggle_preview(state)
            end
          end
        },
      }
    }
  end,
}
