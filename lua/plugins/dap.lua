return {
  'mfussenegger/nvim-dap',
  dependencies = { 'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap-python' },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local widgets = require 'dap.ui.widgets'
    local dapython = require 'dap-python'

    dapui.setup()
    dapython.setup '/run/current-system/sw/bin/python'

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
  end,
}
