vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)

vim.g.netrw_keepdir = 0

-- F5: Build & Run C++ (Chế độ chia đôi màn hình dưới đáy)
vim.keymap.set("n", "<F5>", function()
    -- 1. Lưu file
    vim.cmd("w")

    -- 2. Lấy thông tin file
    local file_abs = vim.fn.expand("%:p")
    local file_name = vim.fn.expand("%:t:r")

    -- 3. Lệnh chạy (Thêm ; read để dừng màn hình chờ bạn xem kết quả)
    local cmd = string.format('mkdir -p build && g++ -g "%s" -o "build/%s" && "build/%s"; echo "\n[Enter to exit]"; read', file_abs, file_name, file_name)

    -- 4. Cấu hình Terminal
    local Terminal = require('toggleterm.terminal').Terminal
    local run_term = Terminal:new({ 
        cmd = cmd,
        hidden = false, 

        -- QUAN TRỌNG: Dòng này quyết định nó nằm dưới đáy
        direction = "horizontal", 

        -- Kích thước: 15 dòng (bạn có thể chỉnh số này to nhỏ tùy ý)
        size = 15,

        close_on_exit = true, -- Bấm Enter xong là tự đóng luôn cho gọn
        auto_scroll = true,
        on_open = function(term)
            vim.cmd("startinsert!")
            vim.cmd("setlocal nonumber norelativenumber")
        end,
    })

    run_term:toggle()
end, { desc = "Build and Run C++ (Bottom)" })
