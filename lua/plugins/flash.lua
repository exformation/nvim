return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  -- stylua: ignore
  keys = {
    { "L", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
