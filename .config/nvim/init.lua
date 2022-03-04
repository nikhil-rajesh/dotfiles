require('plugins')

-- Refresh init.lua and run PackerCompile when saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto'
    }
}

require('material').setup {
    lualine_style = 'default'
}

vim.g.material_style = "deep ocean"
vim.cmd'colorscheme material'

vim.o.nu = true
vim.o.relativenumber = true

-- Sane Tab Settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
