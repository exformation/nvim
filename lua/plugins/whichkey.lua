return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 50
  end,
  opts = {},
  config = function()
    local wk = require 'which-key'

    local tsc = require 'telescope.builtin'
    local lsp = vim.lsp.buf
    local dap = require 'dap'
    local widgets = require 'dap.ui.widgets'

    wk.register {
      ['<leader>'] = {
        s = {
          name = 'search',
          f = { tsc.find_files, 'files' },
          g = { tsc.live_grep, 'grep' },
          b = { tsc.buffers, 'buffers' },
          H = { tsc.help_tags, 'help' },
          k = { tsc.keymaps, 'keymaps' },
          T = { tsc.tags, 'tags' },
          l = { tsc.loclist, 'loclist' },
          c = { tsc.commands, 'commands' },
          q = { tsc.quickfix, 'quickfix' },
          m = { tsc.man_pages, 'man pages' },
          t = { tsc.treesitter, 'treesitter' },
          C = { tsc.colorscheme, 'colorscheme' },
          d = { tsc.diagnostics, 'dianostics' },
          h = {
            c = { tsc.command_history, 'command history' },
            s = { tsc.search_history, 'search history' },
          },
          B = { tsc.current_buffer_fuzzy_find, 'buffer' },
        },
        g = {
          name = 'git',
          c = { tsc.git_commits, 'commits' },
          b = { tsc.git_branches, 'branches' },
        },
        l = {
          name = 'lsp',
          R = { tsc.lsp_references, 'references' },
          D = { tsc.lsp_definitions, 'definitions' },
          I = { tsc.lsp_implementations, 'implementations' },
          S = { tsc.lsp_document_symbols, 'doc symbols' },
          W = { tsc.lsp_workspace_symbols, 'workspace symbols' },
          T = { tsc.lsp_type_definitions, ' types' },

          d = { lsp.definition, 'definition' },
          c = { lsp.declaration, 'declaration' },
          h = { lsp.hover, 'hover' },
          i = { lsp.implementation, 'implementation' },
          s = { lsp.signature_help, 'signature_help' },
          t = { lsp.type_definition, 'type definition' },
          n = { lsp.rename, 'rename' },
          r = { lsp.references, 'references' },
          a = { lsp.code_action, 'code action' },
          f = {
            function()
              lsp.format { async = true }
            end,
            'format',
          },
        },
        d = {
          name = 'dap',
          c = { dap.continue, 'continue' },
          o = { dap.step_over, 'step over' },
          i = { dap.step_into, 'step into' },
          O = { dap.step_out, 'step out' },
          b = { dap.toggle_breakpoint, 'toggle breakpoint' },
          r = { dap.repl.open, 'open repl' },
          l = { dap.run_last, 'run last' },
          h = { widgets.hover, 'hover' },
          p = { widgets.preview, 'preview' },
          f = {
            function()
              widgets.centered_float(widgets.frames)
            end,
            'frames',
          },
          s = {
            function()
              widgets.centered_float(widgets.frames)
            end,
            'scopes',
          },
        },
        q = {
          ':wa | qa<CR>',
          'quit',
        },
        o = {
          require('auto-session.session-lens').search_session,
          'search sessions',
        },
        e = {
          ':Neotree filesystem focus<CR>',
          'neotree',
        },
        t = {
          name = 'treesitter',
        },
        ['<tab>'] = {
          ':b#<CR>',
          'previous buffer',
        },
      },
      J = {
        name = 'next',
        d = { vim.diagnostic.goto_next, 'diagnostic' },
        n = {
          [[<Cmd>lua MiniIndentscope.operator('bottom', true)<CR>]],
          'scope',
        },
      },
      K = {
        name = 'prev',
        d = { vim.diagnostic.goto_prev, 'diagnostic' },
        n = {
          [[<Cmd>lua MiniIndentscope.operator('top', true)<CR>]],
          'scope',
        },
      },
    }
  end,
}
