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
        -- Change surround tags faster
        use "tpope/vim-repeat"
        use "tpope/vim-surround"
        -- Change Root directory
        use "ygm2/rooter.nvim"
        -- Snippets
        use "rafamadriz/friendly-snippets"
        -- Speeds up neovim
        use "lewis6991/impatient.nvim"
        -- Learn Vim Game
        use "ThePrimeagen/vim-be-good"
        -- Markdown Preview
        use "ellisonleao/glow.nvim"

        use {
            "michaelb/sniprun",
            run = "bash ./install.sh",
            config = get_config("sniprun")
        }

        -- Notifications
        use {
            "rcarriga/nvim-notify",
            config = get_config("notify")
        }

        -- Indent blank lines (just like the name)
        use{
            "lukas-reineke/indent-blankline.nvim",
            config = get_config("indent_blankline")
        }

        -- Spell Checking
        use {
            "lewis6991/spellsitter.nvim",
            config = get_config("spellsitter")
        }

        -- Color highlighter
        use {
            "norcalli/nvim-colorizer.lua",
            config = get_config("colorizer")
        }

        -- Smooth Scrolling
        use {
            "karb94/neoscroll.nvim",
            config = get_config("neoscroll")
        }

        -- Dashboard
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

        -- Git decorations that's show changed lines
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

        -- Pictograms for LSP completion
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

        -- Remove trailing spaces
        use {
            'lewis6991/spaceless.nvim',
            config = get_config('spaceless')
        }

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
            },
            config = get_config("telescope")
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
