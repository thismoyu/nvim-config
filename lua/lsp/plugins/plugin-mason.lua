-- 以下插件是用来管理lsp服务的，根据配置自动安装对应的lsp服务，避免手动安装的繁琐
return {
	{
		-- LSP manager
	    "mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			require("../../lsp/config/config-mason-lspconfig")
		end,
	},
}
