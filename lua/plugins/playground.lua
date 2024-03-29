-- return {
--   dir = '/home/exform/repos/file-hints.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--   },
--   config = function()
--     -- require('file-hints').setup {
--     --   prefix = '<leader>m',
--     -- }
--
--     vim.keymap.set('n', '<leader>f', function()
--       package.loaded['file-hints'] = nil
--       require('file-hints').toggle_buffer()
--     end, { desc = 'file hints', noremap = true, silent = true })
--   end,
-- }
-- return {
--   dir = '/home/exform/repos/nvim-plugins/isr.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--   },
--   config = function()
--     -- require('isr').setup {
--     --   prefix = '<C-e>',
--     -- }
--
--     vim.keymap.set('n', '<leader>f', function()
--       package.loaded['isr'] = nil
--       require('isr').setup {
--         jump_prefix = '<c-g>',
--         insert_prefix = '<c-i>',
--       }
--     end, { desc = 'isr', noremap = true, silent = true })
--   end,
-- }
return {
  dir = '/home/exform/repos/nvim-plugins/prsr.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- require('prsr').setup {
    --   prefix = '<C-e>',
    -- }

    vim.keymap.set('n', '<leader>f', function()
      package.loaded['prsr'] = nil
      require('prsr').setup {
        logger = true,
      }
    end, { desc = 'prsr', noremap = true, silent = true })
  end,
}
