local status_ok, iobuffers = pcall(require, "nvim-iobuffers")
if not status_ok then
  vim.print("Missing nvim-iobuffers dependency")
  return
end


iobuffers.setup({
  -- width = 80
})

local iob = require 'nvim-iobuffers'
vim.keymap.set('n', "<M-ENTER>", iob.toggle_iobuffers)
vim.keymap.set('i', "<M-ENTER>", iob.run_command)
vim.cmd([[autocmd VimEnter * :lua require('nvim-iobuffers').toggle_iobuffers()]])
