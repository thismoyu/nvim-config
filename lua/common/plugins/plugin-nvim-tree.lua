-- 左侧的文件列表插件
return {
    {
        "nvim-tree/nvim-tree.lua",
        -- version = "*",
        -- 依赖插件：一些比好的图标
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup {}
            require("../../common/config/config-nvim-tree")
        end
    }
}