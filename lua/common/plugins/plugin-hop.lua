-- 此插件用于代码光标快速跳转
return {
    {
        'smoka7/hop.nvim',
        lazy = true,
        -- only load when press f.
        keys = { "f" , "F" },
        config = function()
            require("hop").setup({})
            require("../../common/config/config-hop")
        end
    }
}