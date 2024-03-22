return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      pre_save_cmds = { ":windo if &buftype != '' | q | endif" },
    }
  end,
}
