return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  config = function()
    -- vim.cmd [[autocmd VimEnter * Neotree filesystem show]]
    require('neo-tree').setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      window = {
        width = 30,
        mappings = {
          ['P'] = {
            'toggle_preview',
            config = { use_float = false, use_image_nvim = true },
          },
        },
      },
    }
  end,
}
