vim.o.nu = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbering
vim.o.cursorline = true -- Show cursor line

-- Set folding
vim.o.foldmethod = 'expr'
vim.o.foldlevel = 99
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Sane Tab Settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Rooter
vim.g.rooter_pattern = {'.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt', 'init.lua'} 
vim.g.outermost_root = true
