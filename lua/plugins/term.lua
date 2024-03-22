return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      shade_terminals = false,
      direction = 'tab',
      open_mapping = [[<c-k>]],
    }
  end,
}
