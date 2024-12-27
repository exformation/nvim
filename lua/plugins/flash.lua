return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  -- opts = {},
  -- stylua: ignore
  keys = {
  --   -- just quits nvim for some reason??
    { "f",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
  --   { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
  --   { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
  --   { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
  config = function()
    -- this fucks up when pressed twice
    -- vim.keymap.set('n', 'f', '<cmd>lua require("flash").jump()<CR>')--, { noremap = true, silent = true })
    -- this also fucks up??
    -- vim.keymap.set('n', 'f', function() require("flash").jump() end, { noremap = true, silent = true })
  end,
}
