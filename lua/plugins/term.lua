return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      direction = 'tab',
      open_mapping = [[<c-k>]],
    }
  end,
}
