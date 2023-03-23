-- TODO: make things like this not have the "press enter" popup all the time
-- async dispatch?
-- TODO: give everything a desc
-- TODO: add everything to which-key

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

-- TODO: how can i avoid entering normal mode?
i('<C-z>', '<ESC><C-z>')

n('<A-j>', ':m .+1<CR>')
n('<A-k>', ':m .-2<CR>')
x('<A-j>', ":m '>+1<CR>gv-gv")
x('<A-k>', ":m '<-2<CR>gv-gv")

nl('b', ':b#<CR>')
nl('q', ':wqa<CR>', { desc = 'Write and quit' })
nl('w', ':wa<CR>', { desc = 'Write buffer' })
nl('sv', ':w | :source ~/.config/nvim/init.lua<CR>', { desc = '[S]ource [V]imrc', silent = true })
-- TODO: list all links matching the pattern in telescope and press enter to gh browse
nl('pg', function()
  vim.cmd 'execute "normal yi\'"'
  vim.cmd(':! firefox github.com/' .. tostring(vim.fn.getreg '0'))
end, { desc = '[P]lugin [G]ithub' })

n('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
n(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- TODO: start collecting all the commands that you want to create mappings for
-- TODO: create a bind for going through all your todo items
-- TODO: create a bind for creating a todo item
-- TODO: make a helper function for making this cleaner
-- TODO: do you want to noun+verb or verb+noun? FS->File->Search, SF->Search->File

-- https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/%2Bevil-bindings.el#L290
local m = {
  f = { name = 'file' },
  b = { name = 'buffer' },
  c = { name = 'command' },
  h = { name = 'help' },
  d = { name = 'dap' },
  l = { name = 'lsp' },
  t = { name = 'ts' },
  g = { name = 'git' },
  s = { name = 'search' },
  n = { name = 'new' },
  v = { name = 'vim' },
  e = { name = 'english' },
  o = { name = 'open' },
  r = { name = 'run' },
  -- just use non-mnemonics i guess
  L = { name = 'Load' },
  T = { name = 'Toggle' },
  S = { name = 'System' },
}

local tb = require 'telescope.builtin'
m.f.n = { '<cmd>enew<cr>', 'new file' }
-- rename, move, copy

m.b.q = { '<cmd>bd<cr>', 'close buffer' }
m.b.b = { '<cmd>b#<cr>', 'previous buffer' }

m.s.a = { tb.autocommands, "autocommands" }
m.s.b = { tb.buffers, "buffers" }
m.s.c = { tb.commands, "commands" }
m.s.e = { tb.diagnostics, "diagnostics" }
m.s.f = { tb.find_files, "find_files" }
m.s.g = { tb.live_grep, "live_grep" }
m.s.h = { tb.command_history, "command_history" }
m.s.j = { tb.jumplist, "jumplist" }
m.s.k = { tb.keymaps, "keymaps" }
m.s.l = { tb.loclist, "loclist" }
m.s.m = { tb.marks, "marks" }
m.s.o = { tb.oldfiles, "oldfiles" }
m.s.q = { tb.quickfix, "quickfix" }
m.s.r = { tb.register, "register" }
m.s.s = { tb.spell_suggest, "spell_suggest" }
m.s.t = { tb.help_tags, "help_tags" }
m.s.v = { tb.vim_options, "vim_options" }
m.s.w = { tb.grep_string, "grep_string" }
m.s.B = { tb.current_buffer_fuzzy_find, "current_buffer_fuzzy_find" }
m.s.D = { tb.lsp_document_symbols, "lsp_document_symbols" }
m.s.F = { tb.git_files, "git_files" }
m.s.H = { tb.search_history, "search_history" }
m.s.M = { tb.man_pages, "man_pages" }
m.s.Q = { tb.quickfixhistory, "quickfixhistory" }
m.s.R = { tb.resume, "resume" }
m.s.T = { tb.treesitter, "treesitter" }
m.s.W = { tb.lsp_workspace_symbols, "lsp_workspace_symbols" }

local lb = vim.lsp.buf
m.l.a = { lb.code_action, 'code_action' }
m.l.d = { tb.lsp_definitions, 'definition(s)' } -- lb.definition
m.l.f = { lb.format, 'format' }
m.l.h = { lb.hover, 'hover' }
m.l.i = { tb.lsp_implementations, 'implemention' }     -- lb.implemention,
m.l.n = { lb.rename, 'rename' }
m.l.r = { tb.lsp_references, 'references' }            -- lb.references,
m.l.s = { lb.signature_help, 'signature_help' }
m.l.t = { tb.lsp_type_definitions, 'type_definition' } --lb.type_definition
m.l.e = { vim.diagnostic.open_float, 'error' }

m.g.g = {
  function()
    lb.format()
    vim.cmd ':! git a && git c "boop" && git p'
  end,
  'format, add, commit, push',
}
m.g.c = { tb.git_commits, 'checkout commit' }
m.g.b = { tb.git_branches, 'checkout branch' }
m.g.s = { tb.git_status, 'status' }


local wk = require 'which-key'
wk.register(m, { prefix = '<leader>' })
