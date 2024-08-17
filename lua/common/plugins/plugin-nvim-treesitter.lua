-- https://github.com/nvim-treesitter/nvim-treesitter
-- 用于代码高亮
return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- version = "*",
        config = function()
            require("nvim-treesitter").setup {}
        end
    }
}