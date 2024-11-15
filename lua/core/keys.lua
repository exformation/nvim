vim.keymap.set({ 't', 'i' }, 'kj', [[<c-\><c-n>]])

vim.keymap.set('n', 'J', '<nop>', { noremap = true, silent = true })
vim.keymap.set('n', 'K', '<nop>', { noremap = true, silent = true })

-- plugin dev (TODO: put these with whichkey?)
vim.keymap.set('n', '<leader>t', [[:w | source %<cr>]], { desc = 'source current file' })
vim.keymap.set('n', '<leader>T', [[<Plug>PlenaryTestFile<cr>]])
vim.keymap.set('n', '<leader>m', [[:messages<cr>]])

-- put in telescope.lua?
vim.keymap.set('c', '<c-r>', [[<Plug>(TelescopeFuzzyCommandSearch)]])

-- vim.keymap.set('n', '<leader>t', function()
--   package.loaded['ts-hints'] = nil
--   require('ts-hints').select()
-- end, { desc = 'ts hints', noremap = true, silent = true })

-- experimenting with shenanigans
-- deleting blank lines in an object like a method doesn't work but it does for indent (because it's a line?)
-- <leader>Din works but <leader>Dif doesn't
-- vim.keymap.set('x', '<leader>f', ":<C-u>'<,'>g/^$/d<CR>", { noremap = true, silent = true })
--
-- vim.g.DeleteBlankLinesOp = function(type)
--   if type == 'line' then
--     print(type)
--     vim.cmd "'<,'>g/^$/d"
--   else
--     local start_pos = vim.fn.getpos "'<"
--     local end_pos = vim.fn.getpos "'>"
--     print(start_pos[2], end_pos[2])
--
--     vim.cmd(start_pos[2] .. ',' .. end_pos[2] .. 'g/^$/d')
--   end
-- end
-- vim.api.nvim_set_keymap('n', '<leader>D', ':set opfunc=v:lua.vim.g.DeleteBlankLinesOp<CR>g@', { noremap = true, silent = true })

-- local e = vim.fn.expand
-- local function run_example()
--   vim.cmd('TermExec cmd="clear && cargo run --example ' .. e '%:t:r' .. ' || cargo run --example ' .. e '%:h:t' .. '"')
--   -- vim.cmd "ToggleTerm"
-- end

local function run2_example()
  local dir = (vim.fn.expand '%:p:r'):match '.*/examples/([^/]+)'
  if dir then
    vim.cmd('TermExec cmd="clear && cargo run --example ' .. dir .. '"')
  else
    print "Not in an example directory"
  end
end

vim.keymap.set('n', '<leader>re', run2_example, { desc = 'run bevy example' })
