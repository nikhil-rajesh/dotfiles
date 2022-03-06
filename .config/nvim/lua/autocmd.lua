-- Refresh init.lua and run PackerCompile when saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
