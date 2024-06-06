return {
    {
        "nvim-tree/nvim-tree.lua",
        -- version = "*",
        -- 依赖插件：一些比好的图标
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup {}
            require("../plugins-config/nvim-tree")
        end
    }
}