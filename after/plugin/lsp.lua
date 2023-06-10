local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}

lspconfig.nil_ls.setup {
  autostart = true,
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixfmt" },
        -- command = { "nixpkgs-fmt" },
      },
    },
  }
}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {
-- Server-specific settings. See `:help lspconfig-setup`
-- settings = {
-- ['rust-analyzer'] = {},
-- },
-- }
