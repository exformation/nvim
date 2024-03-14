return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,
  opts = {},
  config = function()
    local wk = require 'which-key'

    local tsc = require 'telescope.builtin'
    local lsp = vim.lsp.buf
    local dap = require 'dap'
    local widgets = require 'dap.ui.widgets'

    -- TODO: this should probably go somewhere else (require(myterminal) idk)
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
    }

    wk.register {
      ['<leader>'] = {
        s = {
          name = 'search',
          s = {
            function()
              tsc.find_files { find_command = { 'sh', '-c', "rg '' --files-with-matches" } }
            end,
            'text files',
          },
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
          r = { tsc.resume, 'resume' },
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
          l = {
            function()
              lazygit:toggle()
            end,
            'lazygit',
          },
        },
        l = {
          name = 'lsp',
          D = { tsc.lsp_definitions, 'definitions' },
          I = { tsc.lsp_implementations, 'implementations' },
          S = { tsc.lsp_document_symbols, 'doc symbols' },
          W = { tsc.lsp_workspace_symbols, 'workspace symbols' },
          T = { tsc.lsp_type_definitions, ' types' },

          d = { lsp.definition, 'definition' },
          c = { lsp.declaration, 'declaration' },
          h = { lsp.hover, 'hover' },
          i = { lsp.implementation, 'implementation' },
          s = { lsp.signature_help, 'signature help' },
          t = { lsp.type_definition, 'type definition' },
          n = { lsp.rename, 'rename' },
          r = {
            function()
              tsc.lsp_references {
                show_line = false,
              }
            end,
            'references',
          },
          a = { lsp.code_action, 'code action' },
          f = {
            function()
              lsp.format { async = true }
            end,
            'format',
          },
          -- LspInfo
          ['?'] = {
            ':LspInfo<cr>',
            'info',
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
        r = {
          name = 'run',
          d = { ':Overseer run<cr>', 'run' },
        },
        q = {
          ':wa | qa<cr>',
          'quit',
        },
        x = {
          ':q<cr>',
          'close buffer',
        },
        t = {
          name = 'treesitter',
        },
        ['-'] = {
          ':Oil<cr>',
          'oil',
        },
        ['<tab>'] = {
          ':b#<cr>',
          'previous buffer',
        },
      },
      J = {
        name = 'next',
        d = { vim.diagnostic.goto_next, 'diagnostic' },
        n = {
          [[<cmd>lua MiniIndentscope.operator('bottom', true)<cr>]],
          'scope',
        },
      },
      K = {
        name = 'prev',
        d = { vim.diagnostic.goto_prev, 'diagnostic' },
        n = {
          [[<cmd>lua MiniIndentscope.operator('top', true)<cr>]],
          'scope',
        },
      },
    }
  end,
}
