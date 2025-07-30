local dap = require("dap")
local ok, dapui = pcall(require, "dapui")
if not ok then return end

dapui.setup()

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

vim.keymap.set("n", "<leader>dr", function()
  require("dap").run_last()
end, { desc = "Dap: Restart last debug session" })

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", dap.step_over)
vim.keymap.set("n", "<F7>", dap.step_into)
vim.keymap.set("n", "<F8>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dapui.close)
vim.keymap.set("n", "<leader>do", dapui.open)

local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
local codelldb_path = mason_path .. "adapter/codelldb"

dap.adapters.codelldb = function(callback, _)
  callback({
    type = "server",
    port = "${port}",
    executable = {
      command = codelldb_path,
      args = { "--port", "${port}" },
    }
  })
end

dap.configurations.cpp = {
  {
    name = "Запустить с codelldb",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    args = {},
    terminal = "integrated",
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

