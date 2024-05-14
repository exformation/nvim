return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'folke/neodev.nvim',
  },
  config = function()
    require('neodev').setup {
      library = {
        plugins = { 'nvim-treesitter', 'plenary.nvim', 'telescope.nvim' },
      },
      -- override = functionoot_dir, library)
      --   for _, plugin in ipairs({ 'ts-hints.nvim', 'file-hints.nvim' }) do
      --     if root_dir:find('repos/' .. plugin, 1, true) == 1 then
      --       library.enabled = true
      --       library.plugins = true
      --     end
      --   end
      -- end,
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
    -- lspconfig.marksman.setup { capabilities = capabilities }
    lspconfig.csharp_ls.setup { capabilities = capabilities }
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
      -- settings = {
      --   ['rust-analyzer'] = {
      --     cargo = {
      --       extraEnv = {
      --         RUSTFLAGS = '-Clinker=clang -Clink-arg=-fuse-ld=lld',
      --       },
      --     },
      --   },
      -- },
    }
  end,
}
