return {
  'rmagatti/auto-session',
  config = function()
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    vim.cmd [[autocmd VimLeavePre * tabdo Neotree close]]
    require('auto-session').setup {}
  end,
}
