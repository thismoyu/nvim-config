-- https://github.com/lewis6991/gitsigns.nvim
-- 添加git状态等功能
return {
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        event = 'BufRead',
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
        end
    }
}

