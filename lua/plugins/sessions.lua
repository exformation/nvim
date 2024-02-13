-- return {
--   'rmagatti/auto-session',
--   config = function()
--     --vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
--     -- vim.cmd [[autocmd VimLeavePre * windo Neotree close]]
--     -- vim.cmd [[autocmd VimEnter * windo Neotree filesystem show]]
--     require('auto-session').setup {
--       auto_session_pre_save_cmds = { 'Neotree close' },
--       auto_session_post_restore_cmds = { 'Neotree filesystem show' },
--     }
--   end,
-- }

return {
  'folke/persistence.nvim',
  opts = {
    options = { 'blank', 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize', 'winpos', 'terminal', 'localoptions' },
  },
  config = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('restore_session', { clear = true }),
      callback = function()
        if vim.fn.getcwd() ~= vim.env.HOME then
          require('persistence').load()
          vim.cmd [[Neotree filesystem show]]
        end
      end,
      nested = true,
    })
    require('persistence').setup()
  end,
}
