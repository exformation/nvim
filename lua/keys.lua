vim.keymap.set('n', '<leader>q', ':wqa<CR>', {})
vim.keymap.set('n', '<leader><tab>', ':b#<CR>', {})

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist)
