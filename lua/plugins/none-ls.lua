return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- nix
        null_ls.builtins.formatting.nixfmt,
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- markdown

        -- c#
      },
    }
  end,
}
