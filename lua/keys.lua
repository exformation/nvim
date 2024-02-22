vim.keymap.set({ 't', 'i' }, 'jk', [[<c-\><c-n>]])

vim.keymap.set('n', 'J', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>t', function()
  package.loaded['ts-hints'] = nil
  require('ts-hints').select()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>f', function()
  package.loaded['file-hints'] = nil
  require('file-hints').test()
end, { noremap = true, silent = true })

