return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    -- require('mini.surround').setup()
    require('mini.statusline').setup()
    require('mini.move').setup()
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
    }
    vim.keymap.set({ 'o', 'x' }, 'in', function()
      require('mini.indentscope').textobject(false)
    end, { desc = 'scope' })
    vim.keymap.set({ 'o', 'x' }, 'an', function()
      require('mini.indentscope').textobject(true)
    end, { desc = 'scope' })
  end,
}
