-- Bootstrapping if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
  return string.format('require("config/%s")', name)
end

return require("packer").startup(
    function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Material Theme
        use {
            'marko-cerovac/material.nvim',
            config = get_config('material')
        }

        -- Awesome Statusline
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = get_config('lualine')
        }

        -- Well, should I explain more?
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = get_config('treesitter')
        }

        -- Better fuzzy search
        use {
            'nvim-telescope/telescope.nvim',
            requires = { 
                {'nvim-lua/plenary.nvim'},
                { 'kyazdani42/nvim-web-devicons', opt = true }
            },
        }

        -- File explorer
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', opt = true
            },
            config = get_config('nvim-tree')
        }
    end
)
