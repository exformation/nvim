return {
  'voldikss/vim-floaterm',
  config = function()
    vim.keymap.set({ 'i', 'n', 'v', 't' }, '<C-k>', ':FloatermNew<CR>')
    vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:FloatermKill<CR>')
  end,
}
