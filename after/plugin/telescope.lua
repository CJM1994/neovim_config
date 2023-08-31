-- Telescope Remaps
local builtin = require('telescope.builtin')
vim.g.mapleader = ' '

-- Fuzzy Search
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Git Commands
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gb', builtin.git_status, {})

-- Grep
vim.keymap.set('n', '<leader>gr', function()
  builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
