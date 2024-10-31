-- https://github.com/nvim-telescope/telescope.nvim
-- 显示浮动窗口，快速打开文件等
return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup{

            }

            -- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
            -- mode: n(normal),i(insert),v(view)等
            -- lhs : 对应的按键
            -- rhs : 对应的功能
            -- opts: 相应的设置
            -- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
            -- 查找文件(整个文件夹 fd)
            vim.keymap.set("n", "<C-t>", ":Telescope find_files<CR>", opt)
            -- 全局搜索(整个文件夹 rg)
            vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", opt)
        end
    }
}

