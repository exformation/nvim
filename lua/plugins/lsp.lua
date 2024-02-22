return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
  },
  config = function()
    -- plugins = { flash-hints, ... }
    require('neodev').setup {
      override = function(root_dir, library)
        if root_dir:find('/home/exform/repos/flash-hints', 1, true) == 1 then
          library.enabled = true
          library.plugins = true
        end
      end,
    }

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
