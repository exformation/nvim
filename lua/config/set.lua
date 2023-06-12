-- See `:help vim.o`
O = vim.o

O.swapfile = false
O.breakindent = true
O.clipboard = 'unnamedplus'
O.completeopt = 'menuone,noselect'
O.expandtab = true
O.hlsearch = false
O.ignorecase = true
-- O.nohlsearch = true
O.number = true
O.relativenumber = true
O.scrolloff = 999
O.shiftwidth = 2
O.signcolumn = 'yes'
O.smartcase = true
O.tabstop = 2
O.termguicolors = true
O.timeout = true
O.timeoutlen = 0
O.undofile = true
O.updatetime = 0

-- TODO: some of the fold commands (z) are a little awkward
O.foldenable = false
O.foldmethod = 'expr'
O.foldexpr = 'nvim_treesitter#foldexpr()'
-- O.nofoldenable = true
O.foldlevel = 1
