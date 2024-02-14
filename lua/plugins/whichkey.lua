return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  opts = {},
  config = function()
    local wk = require 'which-key'

    local tsc = require 'telescope.builtin'
    local lsp = vim.lsp.buf

    wk.register({
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
        t = { lsp.type_definition, 'type_definition' },
        n = { lsp.rename, 'rename' },
        r = { lsp.references, 'references' },
        a = { lsp.code_action, 'code_action' },
        f = {
          function()
            lsp.format { async = true }
          end,
          'format',
        },
      },
    }, { prefix = '<leader>' })
  end,
}
