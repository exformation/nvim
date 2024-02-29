return {
  dir = '/home/exform/repos/file-hints.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- require('file-hints').setup {
    --   prefix = '<leader>m',
    -- }

    vim.keymap.set('n', '<leader>f', function()
      package.loaded['file-hints'] = nil
      require('file-hints').toggle_buffer()
    end, { desc = 'file hints', noremap = true, silent = true })
  end,
}
