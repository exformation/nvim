local get = function(pkg_name)
  local status_ok, pkg = pcall(require, pkg_name)
  if not status_ok then
    vim.print("Missing " .. pkg_name .. " dependency")
    return nil
  end
  return pkg
end

-- null-ls is needed for LSPs that don't have built-in formatting.
local null_ls = get("null-ls")
if not null_ls then
  return
end
local fmt = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    fmt.nixfmt,
    fmt.shfmt,
  },
  fmt
})

-- neodev helps with neovim development? try to remove later
local neodev = get("neodev")
if not neodev then
  return
end
neodev.setup()

-- lsp config
local lspconfig = get('lspconfig')
if not lspconfig then
  return
end
local cmp_nvim_lsp = get('cmp_nvim_lsp')
if not cmp_nvim_lsp then
  return
end
local capabilities = cmp_nvim_lsp.default_capabilities()
-- PYTHON
lspconfig.pylsp.setup {
  capabilities = capabilities,
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
        flake8 = {
          enabled = true,
        }
      }
    }
  }
}
-- NIX
lspconfig.nil_ls.setup {
  capabilities = capabilities,
}
-- BASH
lspconfig.bashls.setup {
  capabilities = capabilities,
}
-- LUA
lspconfig.lua_ls.setup {
  capabilities = capabilities,
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

