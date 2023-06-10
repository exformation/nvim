local lspconfig = require('lspconfig')

-- PYTHON
-- lspconfig.pyright.setup {
--   settings = {
--     python = {
--       formatting = {
--         command = {"black --quiet -"},
--         formatStdin = true
--       },
--     },
--   }
-- }
lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        -- TODO: autoimport
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 120
        },
        -- TODO: find out which one of these is so annoying and what each one offers
        -- autopep8 = {
        --   enabled = true,
        -- },
        -- pylint = {
        --   enabled = true,
        -- },
        -- flake8 = {
        --   enabled = true,
        -- }
      }
    }
  }
}

-- NIX
lspconfig.nil_ls.setup {
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  }
}

-- LUA
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
