-- P(vim.api.nvim_get_keymap("n"))
P = function(v)
  print(vim.inspect(v))
  return v
end
