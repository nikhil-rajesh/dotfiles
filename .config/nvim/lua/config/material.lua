-- Set the theme style
vim.g.material_style = 'deep ocean'

require('material').setup {
    lualine_style = 'default',
    asyn_loading = true,
    contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        non_current_windows = true, -- Enable darker background for non-current windows
        popup_menu = true, -- Enable lighter background for the popup menu
    },
    italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
	},
}

-- Enable the colorscheme
vim.cmd 'colorscheme material'
