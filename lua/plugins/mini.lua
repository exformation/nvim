return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.move').setup()
    -- TODO: lsp can do this
    require('mini.cursorword').setup {
      delay = 0,
      priority = 2,
    }
    require('mini.indentscope').setup {
      draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
        priority = 2,
      },
      mappings = {
        -- object_scope = 'in',
        -- object_scope_with_border = 'an',
        -- goto_top = 'Kn',
        -- goto_bottom = 'Jn',
      },
      options = {
        border = 'none',
      },
      symbol = '╎',
    }
    vim.keymap.set({ 'o', 'x' }, 'in', require('mini.indentscope').textobject, { desc = 'scope' })
    vim.keymap.set({ 'o', 'x' }, 'an', require('mini.indentscope').textobject, { desc = 'scope' })
  end,
}
