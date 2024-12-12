vim.api.nvim_create_augroup('CenterCursor', { clear = true })
vim.api.nvim_create_augroup('FormatBuffer', { clear = true })
vim.api.nvim_create_augroup('WriteBuffer', { clear = true })
vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('CursorMoved', {
  desc = 'Center the cursor when moving',
  group = 'CenterCursor',
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' then
      vim.cmd [[normal! zz]]
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'VimLeavePre' }, {
  desc = 'Format the buffer before leaving',
  group = 'FormatBuffer',
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' and vim.bo.modified and vim.bo.modifiable then
      if vim.lsp.buf ~= nil and vim.lsp.buf.server_ready ~= nil and vim.lsp.buf.server_ready() then
        vim.lsp.buf.format { async = false }
      end
      vim.cmd 'write'
    end
  end,
})

vim.api.nvim_create_autocmd({ 'FocusLost' }, {
  desc = 'Write the buffer when focus is lost',
  group = 'WriteBuffer',
  pattern = '*',
  callback = function()
    if vim.bo.buftype == '' and vim.bo.modified and vim.bo.modifiable then
      vim.cmd 'write'
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight the yanked text',
  group = 'YankHighlight',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})
