-- TODO: gh integration 
-- TODO: add binds for next/prev hunk
return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {}
  end,
}
