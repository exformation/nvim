vim.api.nvim_create_augroup("CenterCursor", { clear = true })
vim.api.nvim_create_autocmd("CursorMoved", {
  group = "CenterCursor",
  pattern = "*",
  command = "normal! zz",
})
vim.cmd([[autocmd FocusLost * wa]])
vim.cmd([[autocmd BufLeave * wa]])
