return {
  'rmagatti/auto-session',
  config = function()
    -- vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,options,localoptions'
    require('auto-session').setup {
      pre_save_cmds = { ":windo if &buftype != '' | q | endif" }
      -- pre_save_cmds = { 'Neotree close' },
      -- this should only happen after restoring but it causes problems ...
      -- post_restore_cmds = { 'Neotree filesystem show' },
    }
  end,
}
