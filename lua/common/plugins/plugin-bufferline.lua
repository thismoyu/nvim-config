return {
    {
        "akinsho/bufferline.nvim",
        -- version = "*",
        -- devicon has included in plugin 'tree'
        -- dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("bufferline").setup {}
            require("../../common/config/config-bufferline")
        end
    }
}