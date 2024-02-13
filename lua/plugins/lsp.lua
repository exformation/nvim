return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig.lua_ls.setup { capabilities = capabilities }
    lspconfig.nil_ls.setup { capabilities = capabilities }
    lspconfig.pyright.setup { capabilities = capabilities }

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
  end,
}
