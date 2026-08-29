vim.pack.add({
	--  allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
	"https://github.com/mason-org/mason.nvim",

	-- Install and upgrade third party tools automatically
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

-- enable mason and configure icons
require("mason").setup({ -- setup is required
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
	},
})

