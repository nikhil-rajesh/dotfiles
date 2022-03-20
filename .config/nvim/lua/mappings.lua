-- Open vimrc
vim.api.nvim_set_keymap('n', '<leader>v', '<cmd>e $MYVIMRC<CR>', {})

-- Source vimrc
vim.api.nvim_set_keymap('n', '<leader>sv', ':luafile %<CR>', {})

-- System Clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {noremap = true})

-- Markdown Preview
vim.api.nvim_set_keymap('n', '<leader>mp', '<cmd>Glow<cr>', {noremap = true})

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

-- Symbols outline
vim.api.nvim_set_keymap('n', '<leader>ss', ':SymbolsOutline<cr>', {})

-- Renamer
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { noremap = true, silent = true })

-- SnipRun
vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>SnipRunOperator', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>ff', '<Plug>SnipRun', {silent = true})

-- Undo Search Highlighting
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<cr>', {})

-- Force Next search term to center
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {})
