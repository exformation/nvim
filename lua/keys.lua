vim.keymap.set({ 't', 'i' }, 'jk', [[<c-\><c-n>]])

vim.keymap.set('n', 'J', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>t', function()
  package.loaded['ts-hints'] = nil
  require('ts-hints').select()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>f', function()
  package.loaded['file-hints'] = nil
  require('file-hints').toggle_buffer()
end, { noremap = true, silent = true })

-- experimenting with shenanigans
-- deleting blank lines in an object like a method doesn't work but it does for indent (because it's a line?)
-- <leader>Din works but <leader>Dif doesn't
vim.keymap.set('x', '<leader>f', ":<C-u>'<,'>g/^$/d<CR>", { noremap = true, silent = true })

vim.g.DeleteBlankLinesOp = function(type)
  if type == 'line' then
    print(type)
    vim.cmd "'<,'>g/^$/d"
  else
    local start_pos = vim.fn.getpos "'<"
    local end_pos = vim.fn.getpos "'>"
    print(start_pos[2], end_pos[2])

    vim.cmd(start_pos[2] .. ',' .. end_pos[2] .. 'g/^$/d')
  end
end
vim.api.nvim_set_keymap('n', '<leader>D', ':set opfunc=v:lua.vim.g.DeleteBlankLinesOp<CR>g@', { noremap = true, silent = true })
