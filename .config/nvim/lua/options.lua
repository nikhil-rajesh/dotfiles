-- Material theme
vim.g.material_style = "deep ocean"
vim.cmd'colorscheme material'

vim.o.nu = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbering

-- Set folding
vim.o.foldmethod = 'expr'
vim.o.foldlevel = 99
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Sane Tab Settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
