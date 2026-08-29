vim.pack.add{ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

require("catppuccin").setup({
	flavour = "latte", -- latte, frappe, macchiato, mocha
	background = { -- :h background
	    light = "latte",
		dark = "mocha",
	},
})

-- load the colorscheme here
vim.cmd.colorscheme("catppuccin-latte")
