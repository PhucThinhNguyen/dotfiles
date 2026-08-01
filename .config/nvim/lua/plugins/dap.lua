return 
{
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",         -- Giao diện Debug
            "nvim-neotest/nvim-nio",        -- Thư viện hỗ trợ UI
            "williamboman/mason.nvim",      -- Quản lý cài đặt
            "jay-babu/mason-nvim-dap.nvim", -- Cầu nối Mason - DAP
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            -- 1. Bật giao diện (UI)
            ui.setup()

            -- Tự động mở/đóng giao diện khi debug
            dap.listeners.before.attach.dapui_config = function() ui.open() end
            dap.listeners.before.launch.dapui_config = function() ui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
            dap.listeners.before.event_exited.dapui_config = function() ui.close() end

            -- 2. Cấu hình Mason-DAP (Tự động cài codelldb)
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,
                },
            })

            -- 3. Cấu hình chạy C++ (Trỏ vào folder build)
            dap.configurations.cpp = {
                {
                    name = "Debug C++ (Build Folder)",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        -- Đường dẫn: ./build/ten_file
                        return vim.fn.getcwd() .. '/build/' .. vim.fn.expand('%:t:r')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    runInTerminal = true,
                },
            }
            -- C và Rust dùng chung
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            -- 4. Phím tắt
            vim.keymap.set("n", "<F8>", dap.continue, { desc = "Start/Continue Debug" })
	    vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
	    vim.keymap.set('n', '<S-F5>', dap.terminate, { desc = 'Debug: Dừng' })
        end,
}
