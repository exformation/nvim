-- TODO: you removed paragraph dumby
-- JK should work in visual
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
--
-- easy way to delete all matching? 
--
--]
