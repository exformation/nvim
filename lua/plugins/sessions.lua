return {
  'rmagatti/auto-session',
  config = function()
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    vim.cmd [[autocmd VimLeave * windo Neotree close]]
    vim.api.nvim_set_keymap(
      'n',
      '<leader>p',
      ":Neotree close<CR>:lua require('auto-session.session-lens').search_session()<CR>",
      { noremap = true, silent = true }
    )
    require('auto-session').setup {
      post_restore_cmds = { 'Neotree filesystem show' },
    }
  end,
}
