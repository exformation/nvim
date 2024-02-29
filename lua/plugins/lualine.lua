return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        disabled_filetypes = {
          -- TODO: why no work for dap
          -- winbar = { 'neo-tree', 'dapui-watches', 'dapui-stacks', 'dapui-scopes', 'dapui-breakpoints', 'dap-repl', 'dapui-console' },
          -- statusline = { 'neo-tree' },
        },
      },
    }
  end,
}
