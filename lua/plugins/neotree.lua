-- TODO: toggle for only showing files of current filetype
-- TODO: remember expanded directories?
-- TODO: better ID generation?

return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    local file_id_map = {}
    local current_id = 0
    local function generate_id(id)
      if id < 26 then
        return string.char(97 + id)        -- 'a' to 'z'
      elseif id < 52 then
        return string.char(65 + (id - 26)) -- 'A' to 'Z'
      else
        return tostring(id - 52)           -- '0' to '99'
      end
      -- return id
    end

    require('neo-tree').setup {
      window = {
        width = 30,
        mappings = {
          ['Z'] = 'expand_all_nodes',
        },
      },
      enable_git_status = false,
      enable_diagnostics = false,
      close_if_last_window = true,
      sort_function = function(a, b)
        if a.type ~= b.type then
          return a.type > b.type
        end
        local a_mtime = (vim.loop.fs_stat(a.path) or {}).mtime
        local b_mtime = (vim.loop.fs_stat(b.path) or {}).mtime
        return (a_mtime and a_mtime.sec or 0) > (b_mtime and b_mtime.sec or 0)
      end,

      filesystem = {
        follow_current_file = { enabled = true, leave_dirs_open = true },
        -- filtered_items = {
        --   always_show_by_pattern = { '*.lua' },
        --   never_show_by_pattern = { '*' },
        -- },
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
              vim.keymap.set('n', 's' .. id, function()
                vim.cmd('edit ' .. node.path)
              end, { desc = vim.fn.fnamemodify(node.path, ':t'), noremap = true })
            end
            icon.text = file_id_map[node.path]
          end,
        },
      },
      event_handlers = {
        {
          event = 'after_render',
          handler = function()
            local state = require('neo-tree.sources.manager').get_state 'filesystem'
            if vim.api.nvim_buf_get_option(0, 'filetype') == 'neo-tree' then
              if not require('neo-tree.sources.common.preview').is_active() then
                state.config = { use_float = false }
                state.commands.toggle_preview(state)
              end
            end
          end,
        },
      },
    }
  end,
}
