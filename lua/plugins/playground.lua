-- return {
--   dir = '/home/exform/repos/file-hints.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--   },
--   config = function()
--     -- require('file-hints').setup {
--     --   prefix = '<leader>m',
--     -- }
--
--     vim.keymap.set('n', '<leader>f', function()
--       package.loaded['file-hints'] = nil
--       require('file-hints').toggle_buffer()
--     end, { desc = 'file hints', noremap = true, silent = true })
--   end,
-- }
-- return {
--   dir = '/home/exform/repos/nvim-plugins/isr.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--   },
--   config = function()
--     -- require('isr').setup {
--     --   prefix = '<C-e>',
--     -- }
--
--     vim.keymap.set('n', '<leader>f', function()
--       package.loaded['isr'] = nil
--       require('isr').setup {
--         jump_prefix = '<c-g>',
--         insert_prefix = '<c-i>',
--       }
--     end, { desc = 'isr', noremap = true, silent = true })
--   end,
-- }
return {
  -- dir = '/home/exform/repos/nvim-plugins/prsr.nvim',
  -- dependencies = {
  --   'nvim-lua/plenary.nvim',
  -- },
  -- config = function()
  --   -- require('prsr').setup {
  --   --   prefix = '<C-e>',
  --   -- }
  --
  --   vim.keymap.set('n', '<leader>f', function()
  --     package.loaded['prsr'] = nil
  --     require('prsr').setup {
  --       logger = true,
  --     }
  --   end, { desc = 'prsr', noremap = true, silent = true })
  -- end,
}

--[[
-- custom line numbers with ez jumping
local function set_custom_line_numbers()
  local win_id = vim.api.nvim_get_current_win()
  local buf_id = vim.api.nvim_win_get_buf(win_id)
  local line_count = vim.api.nvim_buf_line_count(buf_id)
  local cursor_line = vim.fn.line('.')

  -- Define the alphabet to use as line identifiers
  local alphabet = "abcdefghijklmnopqrstuvwxyz"
  local max_index = #alphabet

  for i = 1, line_count do
    local rel_num = i - cursor_line
    if rel_num ~= 0 and math.abs(rel_num) <= max_index then
      local letter = alphabet:sub(math.abs(rel_num), math.abs(rel_num))
      if rel_num > 0 then
        vim.fn.sign_define("RelNum"..letter, { text = letter, texthl = "LineNr" })
        vim.fn.sign_place(rel_num, '', "RelNum"..letter, buf_id, { lnum = i })
      else
        vim.fn.sign_define("RelNum"..letter, { text = letter:upper(), texthl = "LineNr" })
        vim.fn.sign_place(rel_num, '', "RelNum"..letter, buf_id, { lnum = i })
      end
    else
      vim.fn.sign_unplace('', { id = rel_num, buffer = buf_id })
    end
  end
end

-- Auto-update on cursor move
vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = '*',
  callback = set_custom_line_numbers,
})

-- Keybindings for T<letter> and F<letter>
local function jump_to_letter(direction, letter)
  local alphabet = "abcdefghijklmnopqrstuvwxyz"
  local idx = alphabet:find(letter:lower())
  if not idx then
    return
  end
  local win_id = vim.api.nvim_get_current_win()
  local buf_id = vim.api.nvim_win_get_buf(win_id)
  local cursor_line = vim.fn.line('.')
  local target_line = direction == "up" and cursor_line - idx or cursor_line + idx

  if target_line > 0 and target_line <= vim.api.nvim_buf_line_count(buf_id) then
    vim.api.nvim_win_set_cursor(win_id, { target_line, 0 })
  end
end

-- Bind keys
vim.api.nvim_set_keymap('n', 'T', ":lua jump_to_letter("up", vim.fn.getcharstr())<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'F', ":lua jump_to_letter("down", vim.fn.getcharstr())<CR>", { noremap = true, silent = true })
--]]
