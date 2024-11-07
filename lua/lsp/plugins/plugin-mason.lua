-- 以下插件是用来管理lsp服务的，根据配置自动安装对应的lsp服务，避免手动安装的繁琐
return {
	{
		-- LSP manager
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"mason-org/mason-registry",
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({})
			require("../../lsp/config/config-mason-lspconfig")
		end,
	},
}

