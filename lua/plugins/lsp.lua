return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'pyright' }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})

      vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', '<leader>lH', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, {})
      vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, {})
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format { async = true }
      end, {})
    end
  }
}
