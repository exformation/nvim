-- too many issues with flash fucking avoid it
return {
  'smoka7/hop.nvim',
  config = function()
    local hop = require 'hop'
    hop.setup {}
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('n', 'f', function() hop.hint_char2 { direction = directions.AFTER_CURSOR } end, { remap = true })
    vim.keymap.set('n', 't', function() hop.hint_char2 { direction = directions.BEFORE_CURSOR } end, { remap = true })
    -- vim.keymap.set('', 'gl', function() hop.hint_lines {} end, { remap = true })
  end,
}
