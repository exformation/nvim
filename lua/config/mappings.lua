-- TODO: give everything a desc
-- TODO: Check out :h feedkeys() and :h :map-<expr>

--- HELPER FUNCTIONS ---
local function n(...)
  vim.keymap.set('n', ...)
end

local function v(...)
  vim.keymap.set('v', ...)
end

local function x(...)
  vim.keymap.set('x', ...)
end

local function nl(k, ...)
  n('<leader>' .. k, ...)
end

local function i(...)
  vim.keymap.set('i', ...)
end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- TODO: how can i avoid entering normal mode?
i('<C-z>', "<ESC><C-z>")

n('<A-j>', ':m .+1<CR>')
n('<A-k>', ':m .-2<CR>')
x('<A-j>', ":m '>+1<CR>gv-gv")
x('<A-k>', ":m '<-2<CR>gv-gv")

-- TODO: list all links matching the pattern in telescope and press enter to gh browse
-- nl('pg', function()
--   vim.cmd 'execute "normal yi\'"'
--   vim.cmd(':! firefox github.com/' .. tostring(vim.fn.getreg '0'))
-- end, { desc = '[P]lugin [G]ithub' })

n('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
n(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

local hop = require 'hop'
n('f', hop.hint_char1)
n('t', hop.hint_words)
n('F', hop.hint_lines_skip_whitespace)
n('T', hop.hint_anywhere)

-- TODO: start collecting all the commands that you want to create mappings for
-- TODO: create a bind for going through all your todo items
-- TODO: create a bind for creating a todo item
-- TODO: make a helper function for making this cleaner
-- TODO: do you want to noun+verb or verb+noun? FS->File->Search, SF->Search->File
-- TODO: order wk suggestions such that capital is afterwards?
-- TODO: read feedkeys() docs

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
  ["<tab>"] = { '<cmd>b#<cr>', 'last buffer' }
}

m.n.j = { ':exe "e ".strftime("%F").".md" | exe "normal! i" . strftime("%A") . "\\n\\n"<cr>', 'open today\'s journal entry' }
function _G.check_directory_and_disable_plugin()
  local current_directory = vim.fn.expand('%:p:h')
  if string.match(current_directory, '/repos/journal') then
    require('cmp').setup { enabled = false }
  end
end
vim.cmd('autocmd VimEnter * lua check_directory_and_disable_plugin()')

m.f.n = { '<cmd>enew<cr>', 'new file' }
m.f.m = { ':GMove ', 'move (base directory)' }
m.f.r = { ':GRename ', 'rename (current directory)' }
m.f.d = { '<cmd>GDelete<cr>', 'delete' }
-- copy

m.b.q = { '<cmd>bd<cr>', 'close buffer' }
m.b.b = { '<cmd>b#<cr>', 'last buffer' }
m.b.n = { '<cmd>bn<cr>', 'next buffer' }
m.b.p = { '<cmd>bp<cr>', 'previous buffer' }

m.v.q = { '<cmd>wqa<cr>', 'save and quit' }
m.v.w = { '<cmd>wa<cr>', 'save' }
m.v.Q = { '<cmd>qa!<cr>', 'get me out!' }
m.v.s = { ':source $MYVIMRC<cr>', 'source config' }
m.v.S = { ':source %<cr>', 'source config' }


-- TODO: just do this with a macro? stringify the function name
local tb = require 'telescope.builtin'
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
m.s.x = { function() tb.find_files({ cwd = vim.fn.expand('%:p:h') }) end, "relative find" }
-- TODO: i don't remember what I was doing or if it works but I probably don't need to install 20 plugins for project management
-- just make it yorself it's easy
-- m.s.p = { function() require('telescope').extensions.projects.projects {} end, "projects" }

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
m.g.B = { ':!gh browse<cr>', 'browse' }

m.T.T = { '<cmd>NvimTreeFindFileToggle<cr>', 'toggle tree' }


-- TODO: clean up and move to other files/directories
local e = vim.fn.fnameescape
local dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/")
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local ends_with = function(str, ending)
  return ending == "" or string.sub(str, -string.len(ending)) == ending
end
local get_session_dirs = function()
  local dirs = vim.fn.glob(dir .. "*.vim", true, true)
  local display_dirs = {}
  for _, path in ipairs(dirs) do
    if ends_with(path, "home.vim") then -- or ends_with(path, "home%exform.vim") then
      goto continue
    end
    table.insert(display_dirs, { path, vim.fn.fnamemodify(path, ":t:gs?%?/?:~:r") })
    ::continue::
  end
  return display_dirs
end
local load_session = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "sessions",
    finder = finders.new_table {
      results = get_session_dirs(),
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[2],
          ordinal = entry[2],
        }
      end
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local file = action_state.get_selected_entry().value[1]
        if vim.fn.filereadable(file) ~= 0 then
          -- TODO: i have to clear the current session somehow
          vim.cmd("silent! source " .. e(file))
        end
      end)
      -- TODO: have a mapping for deleting a session file
      return true
    end,
  }):find()
end
m.L.S = { load_session, 'load session' }


local wk = require 'which-key'
wk.register(m, { prefix = '<leader>' })
