vim.opt.termguicolors = true
vim.opt.background = "dark"  
-- Hiện number và căn giữa relative number 
vim.opt.number = true
vim.opt.relativenumber = true

-- Hiện cursor line
vim.opt.cursorline = true

-- Split tab xuống dưới khi mở và bên phải đầu tiên
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tat xuong dong
vim.opt.wrap = false

-- Chuyen doi tab thanh space
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

--Nhan dien giua Ctrl C, V va yy pp trong neovim
vim.opt.clipboard = "unnamedplus"

-- scroll dung o giua
vim.opt.scrolloff = 999

-- Xem cac block trong nhu la cac o
vim.opt.virtualedit = "block"

-- Split view de tat ca nhung chinh sua
vim.opt.inccommand = "split"

-- Ko phan biet lowercase va uppercase khi nhap lenh
vim.opt.ignorecase = true

-- Enable more beautiful colors
vim.opt.termguicolors = true

-- Setup Diagnosics

vim.diagnostic.config({
    virtual_text = true, 
    virtual_lines = false,
})

