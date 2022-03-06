-- Bootstrapping if not installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format('require("config/%s")', name)
end

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        use "tpope/vim-repeat"
        use "tpope/vim-surround"

        -- Smooth Scrolling
        use {
            "karb94/neoscroll.nvim",
            config = get_config("neoscroll")
        }

        -- Change Root directorairblade/vim-rooter
        use {
            "ygm2/rooter.nvim"
        }

        use {
            "goolord/alpha-nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = get_config("alpha")
        }

        -- Material Theme
        use {
            "marko-cerovac/material.nvim",
            config = get_config("material")
        }

        -- Git decorations thats show changed lines
        use {
            'lewis6991/gitsigns.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            },
            config = get_config("gitsigns")
        }

        -- Commenter
        use {
            'numToStr/Comment.nvim',
            config = get_config('comment')
        }

        -- Tree to view symbols in source code
        use{
            "simrat39/symbols-outline.nvim",
            cmd = { "SymbolsOutline" },
            setup = get_config("outline"),
        }

        -- Easier to rename variables
        use{
            "filipdutescu/renamer.nvim",
            requires = {'nvim-lua/plenary.nvim'},
            config = get_config("renamer")
        }

        -- Automatic Bracket Closing
        use {
            "windwp/nvim-autopairs",
            config = get_config("autopairs")
        }

        -- Awesome Statusline
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            config = get_config("lualine")
        }

        -- LSP
        use({ "neovim/nvim-lspconfig", config = get_config("lsp") })

        -- Pictograms fro LSP completion
        use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })

        -- Code Completion
        use({
            "hrsh7th/nvim-cmp",
            requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/vim-vsnip" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip-integ" },
            { "f3fora/cmp-spell" },
            { "octaltree/cmp-look" },
            { "hrsh7th/cmp-calc" },
            { "hrsh7th/cmp-emoji" },
            },
            config = get_config("cmp"),
        })

        -- Snippets
        use "rafamadriz/friendly-snippets"

        -- Well, should I explain more?
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = get_config("treesitter")
        }

        -- Better fuzzy search
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/plenary.nvim"},
                {"kyazdani42/nvim-web-devicons", opt = true}
            }
        }

        -- File explorer
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
                opt = true
            },
            config = get_config("nvim-tree")
        }
    end
)
