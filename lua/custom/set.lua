-- Fat Cursor
vim.opt.guicursor = ''

-- Line Numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Backup Settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undodir'
vim.opt.undofile = true

-- Search Settings
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Scroll & Sidebar
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

-- Updates
vim.opt.updatetime = 50

-- Leader Key
vim.g.mapleader = ' '
