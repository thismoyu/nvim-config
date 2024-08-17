-- https://github.com/nvim-telescope/telescope.nvim
-- 显示浮动窗口，快速打开文件等
return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup()
            require("../../common/config/config-telescope")
        end
    }
}