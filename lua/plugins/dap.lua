return {
  'mfussenegger/nvim-dap',
  dependencies = { 'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap-python' },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local widgets = require 'dap.ui.widgets'
    local dapython = require 'dap-python'

    dapui.setup()
    dapython.setup('/nix/store/qp5zys77biz7imbk6yy85q5pdv7qk84j-python3-3.11.6/bin/python')

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<leader>dc', dap.continue, {})
    vim.keymap.set('n', '<leader>do', dap.step_over, {})
    vim.keymap.set('n', '<leader>di', dap.step_into, {})
    vim.keymap.set('n', '<leader>dO', dap.step_out, {})
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader>dr', dap.repl.open, {})
    vim.keymap.set('n', '<leader>dl', dap.run_last, {})
    vim.keymap.set({ 'n', 'v' }, '<leader>dh', widgets.hover, {})
    vim.keymap.set({ 'n', 'v' }, '<leader>dp', widgets.preview, {})
    vim.keymap.set('n', '<leader>df', function()
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<leader>ds', function()
      widgets.centered_float(widgets.scopes)
    end)
  end,
}
