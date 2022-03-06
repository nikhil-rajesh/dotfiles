vim.g.mapleader = ','

-- Open vimrc
vim.api.nvim_set_keymap('n', '<leader>v', '<cmd>e $MYVIMRC<CR>', {})

-- Source vimrc
vim.api.nvim_set_keymap('n', '<leader>sv', ':luafile %<CR>', {})

-- System Clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {noremap = true})

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

-- vsnip
vim.api.nvim_set_keymap('i', '<Tab>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', "vsnip#jumpable(-1)   ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', "vsnip#jumpable(-1)   ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", {expr = true})

