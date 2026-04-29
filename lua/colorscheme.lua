-- only store the color scheme configuration.
return {
	"catppuccin/nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("catppuccin").setup({
		  flavour = "latte", -- latte, frappe, macchiato, mocha
		  background = { -- :h background
		    light = "latte",
		    dark = "mocha",
		  },
		})
		-- load the colorscheme here
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
