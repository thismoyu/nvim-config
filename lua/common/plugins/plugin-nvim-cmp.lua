-- 代码自动补全插件
return {
    {
        -- Auto-completion engine
        "hrsh7th/nvim-cmp",
        -- version = "*",
        dependencies = {
            "onsails/lspkind.nvim", -- 这个是美化用的
            -- 下面几个是补全候选来源
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer", -- buffer auto-completion
            "hrsh7th/cmp-path", -- path auto-completion
            "hrsh7th/cmp-cmdline", -- cmdline auto-completion
        },
        config = function()
            require("../../common/config/config-nvim-cmp")
        end
    }
}   