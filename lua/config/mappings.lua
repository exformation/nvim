-- TODO: make things like this not have the "press enter" popup all the time
-- async dispatch?

--- HELPER FUNCTIONS ---
function n(...)
  vim.keymap.set('n', ...)
end

function v(...)
  vim.keymap.set('v', ...)
end

function x(...)
  vim.keymap.set('x', ...)
end

function nl(k, ...)
  n('<leader>' .. k, ...)
end

function i(...)
  vim.keymap.set('i', ...)
end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

i('<C-z>', '<ESC><C-z>') -- TODO: how can i avoid entering normal mode?

n('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
n('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

n('<A-j>', ':m .+1<CR>')
n('<A-k>', ':m .-2<CR>')
x("<A-j>", ":m '>+1<CR>gv-gv")
x("<A-k>", ":m '<-2<CR>gv-gv")

nl('ls', [[<cmd>lua require("persistence").load()<cr>]])
nl('b', ':b#<CR>')
nl('q', ':wq<CR>', { desc = 'Write and quit' })
nl('w', ':w<CR>', { desc = 'Write buffer' })
nl('?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
nl('gg', ':! git a && git c "boop" && git p<CR>', { desc = 'add, commit, push' })
nl('sv', ':w | :source ~/.config/nvim/init.lua<CR>', { desc = '[S]ource [V]imrc', silent = true })
nl('<space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
nl('/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer' })
nl('sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
nl('sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
nl('sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
nl('sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
nl('sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
-- TODO: list all links matching the pattern in telescope and press enter to gh browse
nl('pg', function()
  vim.cmd 'execute "normal yi\'"'
  vim.cmd(':! firefox github.com/' .. tostring(vim.fn.getreg '0'))
end, { desc = '[P]lugin [G]ithub' })

n('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
n(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
nl('e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- nl('q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
