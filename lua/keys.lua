vim.keymap.set({ 't', 'i' }, 'jk', [[<c-\><c-n>]])

vim.keymap.set('n', 'J', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>t', function()
  package.loaded['flash-hints'] = nil
  require('flash-hints').select()
end, { noremap = true, silent = true })
