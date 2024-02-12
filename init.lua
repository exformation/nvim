local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
O = vim.o
O.clipboard = 'unnamedplus'
O.expandtab = true
O.ignorecase = true
O.number = false
O.relativenumber = false
O.shiftwidth = 2
O.smartcase = true
O.tabstop = 2
O.termguicolors = true
O.timeout = true
O.timeoutlen = 0
O.undofile = true
O.updatetime = 0

vim.api.nvim_create_augroup("CenterCursor", { clear = true })
vim.api.nvim_create_autocmd("CursorMoved", {
  group = "CenterCursor",
  pattern = "*",
  command = "normal! zz",
})

vim.cmd([[autocmd FocusLost * :wa]])
vim.cmd([[autocmd BufLeave * :wa]])

require("lazy").setup("plugins")

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
