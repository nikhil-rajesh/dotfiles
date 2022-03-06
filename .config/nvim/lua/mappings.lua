vim.g.mapleader = ','

-- Split Management
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', {})

-- Telescope Mappings
vim.api.nvim_set_keymap('n', '<C-f>f', '<cmd>Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>g', '<cmd>Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>b', '<cmd>Telescope buffers<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>r', '<cmd>Telescope registers<cr>', {})
vim.api.nvim_set_keymap('n', '<C-f>t', '<cmd>Telescope treesitter<cr>', {})

-- NvimTree
vim.api.nvim_set_keymap('n', '<leader>si', '<cmd>NvimTreeToggle<cr>', {})
