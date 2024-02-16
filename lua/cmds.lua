vim.api.nvim_create_augroup('CenterCursor', { clear = true })
vim.api.nvim_create_autocmd('CursorMoved', {
  group = 'CenterCursor',
  pattern = '*',
  command = 'normal! zz',
})

vim.api.nvim_create_autocmd({ 'FocusLost', 'BufLeave', 'VimLeavePre' }, {
  pattern = '*',
  callback = function()
    if vim.bo.modified then
      if vim.lsp.buf.server_ready() then
        vim.lsp.buf.format { async = false }
      end
      if vim.bo.modifiable then
        vim.cmd 'write'
      end
    end
  end,
})
