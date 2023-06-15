local status_ok, iobuffers = pcall(require, "nvim-iobuffers")
if not status_ok then
  vim.print("Missing nvim-iobuffers dependency")
  return
end


iobuffers.setup({})
