return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig.lua_ls.setup { capabilities = capabilities }
    lspconfig.nil_ls.setup {
      capabilities = capabilities,
      settings = {
        ['nil'] = {
          nix = {
            flake = {
              --autoEvalInputs = true,
              autoArchive = true,
            },
          },
        },
      },
    }
    lspconfig.pyright.setup { capabilities = capabilities }
    lspconfig.marksman.setup {}
    lspconfig.csharp_ls.setup {}
  end,
}
