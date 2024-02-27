vim.api.nvim_create_augroup('CenterCursor', { clear = true })
vim.api.nvim_create_autocmd('CursorMoved', {
  group = 'CenterCursor',
  pattern = '*',
  callback = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') == '' then
      vim.api.nvim_exec('normal! zz', false)
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'VimLeavePre' }, {
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' and vim.bo.modified and vim.bo.modifiable then
      if vim.lsp.buf.server_ready() then
        vim.lsp.buf.format { async = false }
      end
      vim.cmd 'write'
    end
  end,
})

vim.api.nvim_create_autocmd({ 'FocusLost' }, {
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' and vim.bo.modified and vim.bo.modifiable then
      vim.cmd 'write'
    end
  end,
})
