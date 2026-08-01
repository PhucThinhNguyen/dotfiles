return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
        enabled = false,
		config = function ()
			vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })
			require("neo-tree").setup({
				-- 1. Chỉnh viền cửa sổ popup cho đẹp (bo góc)
				-- Có thể đổi thành "double" (viền đôi), "solid" (viền nét liền), "shadow" (đổ bóng)
				popup_border_style = "rounded", 

				window = {
					-- 2. ĐÂY LÀ DÒNG QUAN TRỌNG NHẤT: Biến nó thành popup
					position = "float", 

					-- 3. Cấu hình chi tiết cho cái popup (kích thước, vị trí)
					popup = {
						size = { 
							width = "60%",   -- Chiều rộng chiếm 60% màn hình
							height = "80%",  -- Chiều cao chiếm 80% màn hình
						},
						position = "50%",  -- "50%" nghĩa là canh chính giữa màn hình tuyệt đối
					},
				},

				filesystem = {
					filtered_items = {
						visible = true, 
					},
					follow_current_file = {
						enabled = true, 
					},
					-- 4. Tự động đóng popup sau khi ông chọn mở 1 file
					window = {
						mappings = {
							["<cr>"] = "open", -- Nhấn Enter là mở file và đóng Neo-tree
							["l"] = "open",    -- Nhấn 'l' cũng mở file và đóng Neo-tree
						},
					},
				},
			})
		end,    	
	},
}
