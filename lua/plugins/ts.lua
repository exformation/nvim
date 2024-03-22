-- JK should work in visual
-- repeat should still work for stuff like ft
-- get indent to be defined here
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'
    local rep = require 'nvim-treesitter.textobjects.repeatable_move'
    vim.keymap.set({ 'n', 'x', 'o' }, ';', rep.repeat_last_move_next)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', rep.repeat_last_move_previous)

    configs.setup {
      ensure_installed = {},
      ignore_install = {},
      modules = {},
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- around
            ['ac'] = { query = '@class.outer', desc = 'class' },
            ['ae'] = { query = '@assignment.outer', desc = 'assignment' },
            ['am'] = { query = '@function.outer', desc = 'function' },
            ['ai'] = { query = '@conditional.outer', desc = 'if' },
            ['ao'] = { query = '@loop.outer', desc = 'loop' },
            ['af'] = { query = '@call.outer', desc = 'call' },
            ['aa'] = { query = '@parameter.outer', desc = 'arg' },
            ['a/'] = { query = '@comment.outer', desc = 'comment' },

            -- inside
            ['ic'] = { query = '@class.inner', desc = 'class' },
            ['ie'] = { query = '@assignment.inner', desc = 'assignment' },
            ['im'] = { query = '@function.inner', desc = 'function' },
            ['ii'] = { query = '@conditional.inner', desc = 'if' },
            ['io'] = { query = '@loop.inner', desc = 'loop' },
            ['if'] = { query = '@call.inner', desc = 'call' },
            ['ia'] = { query = '@parameter.inner', desc = 'arg' },
            ['i/'] = { query = '@comment.inner', desc = 'comment' },

            -- left/right
            ['le'] = { query = '@assignment.lhs', desc = 'assignment' },
            ['re'] = { query = '@assignment.rhs', desc = 'assignment' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['JA'] = { query = '@parameter.inner', desc = 'swap arg' },
          },
          swap_previous = {
            ['KA'] = { query = '@parameter.inner', desc = 'swap arg' },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['Jm'] = { query = '@function.outer', desc = 'function' },
            ['Jc'] = { query = '@class.outer', desc = 'class' },
            ['Ji'] = { query = '@conditional.outer', desc = 'if' },
            ['Jo'] = { query = '@loop.outer', desc = 'loop' },
            ['Je'] = { query = '@assignment.outer', desc = 'assignment' },
            ['Jf'] = { query = '@call.outer', desc = 'call' },
            ['Ja'] = { query = '@parameter.outer', desc = 'arg' },
            ['J/'] = { query = '@comment.outer', desc = 'comment' },
          },
          goto_previous_start = {
            ['Km'] = { query = '@function.outer', desc = 'function' },
            ['Kc'] = { query = '@class.outer', desc = 'class' },
            ['Ki'] = { query = '@conditional.outer', desc = 'if' },
            ['Ko'] = { query = '@loop.outer', desc = 'loop' },
            ['Ke'] = { query = '@assignment.outer', desc = 'assignment' },
            ['Kf'] = { query = '@call.outer', desc = 'call' },
            ['Ka'] = { query = '@parameter.outer', desc = 'arg' },
            ['K/'] = { query = '@comment.outer', desc = 'comment' },
          },
        },
      },
    }
  end,
}
-- plugin that shows a list of all text objects that are valid for the file and highlights them
--[
-- delete/change/yank/visual/goto/mark/swap/search
-- inner/around/next/prev/first/last (repeatable)(surroundable)
-- select/swap/move
-- cci -> change condition of if statement?
-- cbi -> change body of if statement?
-- hjkl
-- word cases
-- noun/verb/adjective/adverb
-- operator (left/right/inner/around)
-- function/method
-- class/struct/enum/union/namespace/module/package/object
-- condition/if/else/switch/try/catch/finally
-- loop/for/while/do/foreach
-- parameter/argument
-- assignment/declaration/initialization
-- comment
-- call/invocation
-- string/character/number/boolean
-- file
-- statement
-- expression
-- sentence/paragraph
-- word/character/line
-- block/parenthesis/bracket/brace
-- list/array/vector
-- pair/key/value/property/attribute/field
-- quote
-- tag/element/attribute
-- header/source
-- body/footer
-- git/hunk/diff
-- diagnostic/error/warning/hint/info
-- indent/blanklines
-- universe (whole file)
-- url, owner/repo, email, phone (might as well make super niche shit selectable via telescope and then it's repeatable)
-- qflist item? tons of things could be part of a list that you can nav, but should the list item be an object?
-- search match: you can unmap nN and do j/k{match}.... to move between matches
-- start of line, end of line, start of file, end of file ... even these are objects?
-- breakpoints ...
-- folds
-- history
-- jump list
-- source tag
-- next/prev buffer/window/tab
-- some of these make sense for next/prev but as objects?
-- also the way in which you typically like to go to the *previous* buffer is not the same
-- TODO/FIXME/NOTE etc
-- staged files
--
-- easy way to delete all matching?
-- you should really generalize and just rely on repeating
-- like, move hjklm etc to text objects, do things like {next}w . . . to advance words
-- tons of things could be
--
-- s is surround so maybe w could be swap
--
-- motions are just text objects being fed into next/prev automatically
--
-- {verb}{modifier}{object}
-- if I get rid of the default motions in favor of something more general, then modifiers are super empty
-- you get around/inner for most things, left/right for some things
-- maybe you could do something like cji" to change inner of the next pair of quotes (or cki" etc)
--
-- repeat-forward/repeat-backward
--
-- okay so you could do crazy shit like wkrai( to swap the right side of the assignment above you with i(
--
-- gw (goto-word) could put a hint on all words?
--
-- god you could get insane with this, each operator could be an object, so doing things like cl+ would change the left side of the + operator
-- this means you should probably have a more generic operator object that takes the operator as an argument
-- clo/<cr>
-- so if way below you there's a something/something operation, you can immediately change the numerator
-- just doing clo<cr> will change the left side of the operator you're in or nearest right/down
--
-- the search verb can accept an object so you can search all those objects /im -> search the contents  of all methods in the buffer
-- should there be a modifier that let's you do these {verb}{modifier}{object} actions across multiple files?
-- */ra search all files for right side of assignments ... idk if ts keeps all files open like that - probably not?
--
-- because so many things will not have around/inner, should you swap the order?
-- {verb}{object}{modifier}
-- d$ short circuits because it has no modifiers, w has a modifier so dwa wouldn't
-- otherwise if you want things like d$ to stay concise you'll have to polute all the modifiers with objects
-- local function swapCommandOrder()
--     local char1 = vim.fn.nr2char(vim.fn.getchar())
--     local char2 = vim.fn.nr2char(vim.fn.getchar())
--     return char2 .. char1
-- end
-- vim.api.nvim_set_keymap('n', 'c', '"c" .. swapCommandOrder()', { noremap = true, expr = true })
-- vim.api.nvim_set_keymap('n', 'd', '"d" .. swapCommandOrder()', { noremap = true, expr = true })
-- you need to see how plugins do it -> gcc is in the keymaps but gciw isn't
--
-- commenting something is both an object and a verb
-- gBkm -> block comment previous method
-- j/  -> next comment

--
--]
