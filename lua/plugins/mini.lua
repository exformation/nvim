return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.move').setup()
    require('mini.cursorword').setup {
      delay = 50,
    }
    require('mini.indentscope').setup {
      draw = {
        delay = 0,
        priority = 0,
      },
      mappings = {
        object_scope = 'in',
        object_scope_with_border = 'an',
        goto_top = 'Kn',
        goto_bottom = 'Jn',
      },
      options = {
        border = 'none',
      },
      symbol = '',
    }
  end,
}
