return {
    {
        -- https://github.com/hedyhli/outline.nvim
        -- 此插件依赖于lsp，需要配置了lsp服务，符号表由lsp提供
        "hedyhli/outline.nvim",
        config = function()
            require("outline").setup()
            require("../../common/config/config-outline")
        end,
    }
}
