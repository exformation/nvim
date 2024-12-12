return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', 't', '<Nop>', { noremap = true, silent = true })
    local file_id_map = {}
    local current_id = 0

    -- Function to generate an ID string based on current_id
    local function generate_id(id)
      -- if id < 26 then
      --   return string.char(97 + id)        -- 'a' to 'z'
      -- elseif id < 52 then
      --   return string.char(65 + (id - 26)) -- 'A' to 'Z'
      -- else
      --   return tostring(id - 52)           -- '0' to '99'
      -- end
      return id
    end

    require('neo-tree').setup {
      window = {
        width = 30,
        mappings = {
          ['P'] = { 'toggle_preview', config = { use_float = false } },
        },
      },
      enable_git_status = false,
      enable_diagnostics = false,
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true, leave_dirs_open = true },
      },

      default_component_configs = {
        icon = {
          provider = function(icon, node, _)
            if node.type ~= 'file' then
              return
            end

            -- Assign an ID if the node.path is not yet mapped
            if not file_id_map[node.path] then
              file_id_map[node.path] = generate_id(current_id)
              local id = file_id_map[node.path]
              current_id = current_id + 1

              -- Set up a mapping for <prefix><id>
              vim.keymap.set('n', 't' .. id, function()
                vim.cmd('edit ' .. node.path)
              end, { desc = vim.fn.fnamemodify(node.path, ':t'), noremap = true })
            end

            -- Display the icon text
            icon.text = file_id_map[node.path]
          end,
          default = '*',
          highlight = 'NeoTreeFileIcon',
        },
      },
      -- event_handlers = {
      --   {
      --     event = 'after_render',
      --     handler = function()
      --       local state = require('neo-tree.sources.manager').get_state 'filesystem'
      --       if not require('neo-tree.sources.common.preview').is_active() then
      --         state.config = { use_float = false }
      --         state.commands.toggle_preview(state)
      --       end
      --     end,
      --   },
      -- },
    }
  end,
}
