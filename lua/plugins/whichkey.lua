return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,
  opts = {
    icons = { mappings = false },
  },
  config = function()
    local wk = require 'which-key'
    local tsc = require 'telescope.builtin'
    local lsp = vim.lsp.buf
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'tab',
    }

    wk.add {
      { '<leader>s',   group = 'search' },
      {
        '<leader>ss',
        function()
          tsc.find_files { find_command = { 'sh', '-c', "rg '' --files-with-matches" } }
        end,
        desc = 'Text files',
      },
      { '<leader>sf',  tsc.find_files,                desc = 'Files' },
      { '<leader>sg',  tsc.live_grep,                 desc = 'Grep' },
      { '<leader>sb',  tsc.buffers,                   desc = 'Buffers' },
      { '<leader>sH',  tsc.help_tags,                 desc = 'Help' },
      { '<leader>sk',  tsc.keymaps,                   desc = 'Keymaps' },
      { '<leader>sT',  tsc.tags,                      desc = 'Tags' },
      { '<leader>sl',  tsc.loclist,                   desc = 'Loclist' },
      { '<leader>sc',  tsc.commands,                  desc = 'Commands' },
      { '<leader>sq',  tsc.quickfix,                  desc = 'Quickfix' },
      { '<leader>sm',  tsc.man_pages,                 desc = 'Man pages' },
      { '<leader>st',  tsc.treesitter,                desc = 'Treesitter' },
      { '<leader>sC',  tsc.colorscheme,               desc = 'Colorscheme' },
      { '<leader>sd',  tsc.diagnostics,               desc = 'Diagnostics' },
      { '<leader>sr',  tsc.resume,                    desc = 'Resume' },
      { '<leader>shc', tsc.command_history,           desc = 'Command history' },
      { '<leader>shs', tsc.search_history,            desc = 'Search history' },
      { '<leader>sB',  tsc.current_buffer_fuzzy_find, desc = 'Buffer' },

      { '<leader>g',   group = 'git' },
      { '<leader>gc',  tsc.git_commits,               desc = 'Commits' },
      { '<leader>gb',  tsc.git_branches,              desc = 'Branches' },
      {
        '<leader>gl',
        function()
          lazygit:toggle()
        end,
        desc = 'Lazygit',
      },

      { '<leader>l',  group = 'lsp' },
      { '<leader>lD', tsc.lsp_definitions,       desc = 'Definitions' },
      { '<leader>lI', tsc.lsp_implementations,   desc = 'Implementations' },
      { '<leader>lS', tsc.lsp_document_symbols,  desc = 'Doc symbols' },
      { '<leader>lW', tsc.lsp_workspace_symbols, desc = 'Workspace symbols' },
      { '<leader>lT', tsc.lsp_type_definitions,  desc = 'Types' },
      { '<leader>ld', lsp.definition,            desc = 'Definition' },
      { '<leader>lc', lsp.declaration,           desc = 'Declaration' },
      { '<leader>lh', lsp.hover,                 desc = 'Hover' },
      { '<leader>li', lsp.implementation,        desc = 'Implementation' },
      { '<leader>ls', lsp.signature_help,        desc = 'Signature help' },
      { '<leader>lt', lsp.type_definition,       desc = 'Type definition' },
      { '<leader>ln', lsp.rename,                desc = 'Rename' },
      {
        '<leader>lr',
        function()
          tsc.lsp_references { show_line = false }
        end,
        desc = 'References',
      },
      { '<leader>la',    lsp.code_action,          desc = 'Code action' },
      {
        '<leader>lf',
        function()
          lsp.format { async = true }
        end,
        desc = 'Format',
      },
      { '<leader>l?',    '<cmd>LspInfo<cr>',       desc = 'Info' },
      -- { '<leader>r',     ':Overseer run<cr>',      desc = 'Run' },
      { '<leader>q',     ':wa | qa<cr>',           desc = 'Quit' },
      { '<leader>x',     ':q<cr>',                 desc = 'Close buffer' },
      { '<leader>-',     ':Oil<cr>',               desc = 'Oil' },
      { '<leader><tab>', ':b#<cr>',                desc = 'Previous buffer' },
      { 'Jd',            vim.diagnostic.goto_next, desc = 'Next diagnostic' },
      { 'Kd',            vim.diagnostic.goto_prev, desc = 'Prev diagnostic' },
    }
  end,
}
