-- TODO: you removed paragraph dumby
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'
    local rep = require 'nvim-treesitter.textobjects.repeatable_move'
    vim.keymap.set({ 'n', 'x', 'o' }, ';', rep.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', rep.repeat_last_move_previous)

    configs.setup {
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- around
            ['ac'] = { query = '@class.outer', desc = 'class' },
            ['ae'] = { query = '@assignment.outer', desc = 'assignment' },
            ['am'] = { query = '@function.outer', desc = 'function' },
            ['ai'] = { query = '@conditional.outer', desc = 'if' },
            ['ao'] = { query = '@loop.outer', desc = 'loop' },
            ['af'] = { query = '@call.outer', desc = 'call' },
            ['ap'] = { query = '@parameter.outer', desc = 'parameter' },
            ['a/'] = { query = '@comment.outer', desc = 'comment' },

            -- inside
            ['ic'] = { query = '@class.inner', desc = 'class' },
            ['ie'] = { query = '@assignment.inner', desc = 'assignment' },
            ['im'] = { query = '@function.inner', desc = 'function' },
            ['ii'] = { query = '@conditional.inner', desc = 'if' },
            ['io'] = { query = '@loop.inner', desc = 'loop' },
            ['if'] = { query = '@call.inner', desc = 'call' },
            ['ip'] = { query = '@parameter.inner', desc = 'parameter' },
            ['i/'] = { query = '@comment.outer', desc = 'comment' },

            -- left/right
            ['le'] = { query = '@assignment.lhs', desc = 'assignment' },
            ['re'] = { query = '@assignment.rhs', desc = 'assignment' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['JP'] = { query = '@parameter.inner', desc = 'swap parameter' },
          },
          swap_previous = {
            ['KP'] = { query = '@parameter.inner', desc = 'swap parameter' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['Jm'] = { query = '@function.outer', desc = 'function' },
            ['Jc'] = { query = '@class.outer', desc = 'class' },
            ['Ji'] = { query = '@conditional.outer', desc = 'if' },
            ['Jo'] = { query = '@loop.outer', desc = 'loop' },
            ['Je'] = { query = '@assignment.outer', desc = 'assignment' },
            ['Jf'] = { query = '@call.outer', desc = 'call' },
            ['Jp'] = { query = '@parameter.outer', desc = 'parameter' },
            ['J/'] = { query = '@comment.outer', desc = 'comment' },
          },
          goto_previous_start = {
            ['Km'] = { query = '@function.outer', desc = 'function' },
            ['Kc'] = { query = '@class.outer', desc = 'class' },
            ['Ki'] = { query = '@conditional.outer', desc = 'if' },
            ['Ko'] = { query = '@loop.outer', desc = 'loop' },
            ['Ke'] = { query = '@assignment.outer', desc = 'assignment' },
            ['Kf'] = { query = '@call.outer', desc = 'call' },
            ['Kp'] = { query = '@parameter.outer', desc = 'parameter' },
            ['K/'] = { query = '@comment.outer', desc = 'comment' },
          },
        },
      },
    }
  end,
}
