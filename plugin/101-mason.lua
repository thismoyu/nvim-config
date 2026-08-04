vim.pack.add({
	-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
	"https://github.com/mason-org/mason-lspconfig.nvim",

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

require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = {
			"rust_analyzer",
		},
	},
	ensure_installed = {
		"lua_ls",
		"pyright",
		"clangd",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
	},
})

