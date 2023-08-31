-- Nvim Remaps
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Move Lines & Respect Indentation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- Keep Cursor Center On Half Page Move
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep Cursor Center On Search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste Over Without Losing Buffer
vim.keymap.set('x', '<leader>p', "\"_dP")

