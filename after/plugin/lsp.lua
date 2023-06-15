local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.print("Missing null-ls dependency")
  return
end


F = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    F.nixfmt,
    F.shfmt,
  },
})

require("neodev").setup()
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
  single_file_support = true,
  settings = {
    pylsp = {
      plugins = {
        -- TODO: autoimport
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 120
        },
        autopep8 = {
          enabled = true,
        },
        -- TODO: find out which one of these is so annoying and what each one offers
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
}

-- BASH
lspconfig.bashls.setup {
}

-- LUA
-- TODO: I can use neodev for this?
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      completion = {
        callSnippet = "Replace"
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
