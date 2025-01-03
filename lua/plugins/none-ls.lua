-- https://www.youtube.com/watch?v=q-oBU2fO1H4
return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua.with {
          extra_args = { '--column-width', '140', '--collapse-simple-statement', 'Always' },
        },
        -- nix
        null_ls.builtins.formatting.nixfmt,
        -- python
        null_ls.builtins.formatting.black.with {
          extra_args = { '--line-length', '140' },
        },
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.nimpretty.with {
          extra_args = { '--maxLineLen:', '140' },
        },
        -- null_ls.builtins.formatting.rustfmt,
        -- markdown
        -- null_ls.builtins.code_actions.proselint,
        -- null_ls.builtins.diagnostics.proselint, -- error
        -- null_ls.builtins.diagnostics.alex, -- horrible
        -- null_ls.builtins.diagnostics.write_good,
        -- null_ls.builtins.hover.dictionary, -- this is horrible lol
        -- null_ls.builtins.formatting.prettierd,
        -- c#
      },
    }
  end,
}
