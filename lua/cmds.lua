vim.api.nvim_create_augroup('CenterCursor', { clear = true })
vim.api.nvim_create_autocmd('CursorMoved', {
  group = 'CenterCursor',
  pattern = '*',
  command = 'normal! zz',
})

vim.cmd [[autocmd FocusLost * lua vim.lsp.buf.format({ async = false }); vim.cmd('wa')]]
vim.cmd [[autocmd BufLeave * lua vim.lsp.buf.format({ async = false }); vim.cmd('wa')]]
