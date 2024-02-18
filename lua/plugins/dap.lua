return {
  'mfussenegger/nvim-dap',
  dependencies = { 'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap-python' },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    dapui.setup()

    require('dap.ext.vscode').json_decode = require('overseer.json').decode

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

    -- python (stupid and doesn't work)
    local dapython = require 'dap-python'
    dapython.setup '/run/current-system/sw/bin/python'

    -- c# (also need hardcoded paths which is stupid)
    dap.adapters.coreclr = {
      type = 'executable',
      command = '/path/to/dotnet/netcoredbg/netcoredbg',
      args = { '--interpreter=vscode' },
    }
    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'launch - netcoredbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }
  end,
}
