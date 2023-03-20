vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config'

-- TODO: formatting
-- TODO: copy doom-emacs/nvchad whichkey binds
-- TODO: debug LSP
-- TODO: prettify telescope
-- TODO: more telescope binds
-- TODO: sneak-type plugins
-- TODO: folds
-- TODO: bind for moving lines up and down
-- TODO: run command
--   dir = ~/.config/awesome -> restart awm
--   dir = ~/.config/nvim    -> source config
--   dir = ~/nix/            -> nrs
--   dir = contains main.py  -> python main.py ?
-- TODO: start separating everything out into other files
-- TODO: don't open help buffers in a new window
-- TODO: insert mode leader key M-SPC
--vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]


