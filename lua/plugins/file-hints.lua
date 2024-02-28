return {
  dir = '/home/exform/repos/file-hints.nvim',
  config = function()
    require('file-hints').setup {
      a = 2,
    }

    vim.keymap.set('n', '<leader>f', function()
      package.loaded['file-hints'] = nil
      require('file-hints').toggle_buffer()
    end, { desc = 'file hints', noremap = true, silent = true })
  end,
}
