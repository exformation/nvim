vim.keymap.set({ 't', 'i' }, 'jk', [[<c-\><c-n>]])

vim.keymap.set('n', 'J', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>t', ":lua require'flash-hints'.select()<CR>")
