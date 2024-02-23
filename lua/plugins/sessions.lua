return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      pre_save_cmds = { 'Neotree close' },
      -- this should only happen after restoring but it causes problems ...
      -- post_restore_cmds = { 'Neotree filesystem show' },
    }
  end,
}
