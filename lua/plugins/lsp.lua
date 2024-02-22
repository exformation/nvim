return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
  },
  config = function()
    my_plugins = { 'ts-hints', 'file-hints' }
    require('neodev').setup {
      override = function(root_dir, library)
        for _, plugin in ipairs(my_plugins) do
          if root_dir:find('/home/exform/repos/' .. plugin, 1, true) == 1 then
            library.enabled = true
            library.plugins = true
          end
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
    lspconfig.marksman.setup { capabilities = capabilities }
    lspconfig.csharp_ls.setup { capabilities = capabilities }
  end,
}
