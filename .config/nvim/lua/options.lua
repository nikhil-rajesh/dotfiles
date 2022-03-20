vim.o.nu = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbering
vim.o.cursorline = true -- Show cursor line

-- Change default notification function
vim.notify = require("notify")

-- Set Leader
vim.g.mapleader = ','

-- Completion
vim.o.completeopt = "menu,menuone,noselect"

-- Set folding
vim.o.foldmethod = 'expr'
vim.o.foldlevel = 30
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Sane Tab Settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Rooter
vim.g.rooter_pattern = {'composer.json', '.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt', 'init.lua'}
vim.g.outermost_root = false

-- Misc
vim.o.termguicolors = true
vim.o.spell = true
