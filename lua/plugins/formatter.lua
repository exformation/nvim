return {
  'mhartington/formatter.nvim',
  config = function()
    local util = require 'formatter.util'
    require('formatter').setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        nim = {
          function()
            return {
              exe = 'nimpretty',
              args = {
                '--maxLineLen:120',
                util.escape_path(util.get_current_buffer_file_path()),
              },
              stdin = false,
            }
          end,
        },
      },
    }
  end,
}
