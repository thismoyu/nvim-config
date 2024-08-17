-- 此插件用于代码光标快速跳转
return {
    {
        'smoka7/hop.nvim',
        -- lazy = true,
        -- keys = { "E" },
        config = function()
            require("hop").setup({})
            require("../../common/config/config-hop")
        end
    }
}