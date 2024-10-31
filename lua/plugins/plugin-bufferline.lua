return {
    {
        "akinsho/bufferline.nvim",
        -- version = "*",
        -- devicon has included in plugin 'tree'
        -- dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("bufferline").setup {
                options = {
                    -- 模式改为 tabs，只显示真实的tabs 不显示buffers
                    -- mode = "tabs",
                    -- 以下两个命令需要 moll/vim-bbye 插件
                    -- close_command = "bdelete! %d",       -- 点击关闭按钮关闭
                    -- right_mouse_command = "bdelete! %d", -- 右键点击关闭

                    -- indicator = {
                    --  icon = ' | ', -- 分割线
                    --  style = 'underline',
                    -- },
                    -- buffer_close_icon = '󰅖',
                    -- modified_icon = '●',
                    -- close_icon = '',
                    -- bufferline 标签页不要显示到左侧的NvimTree上边去
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer" ,
                            text_align = "left",
                            separator = true,
                        }
                    },
                }
            }

            -- 这个函数需要传入四个参数，分别是 mode , lhs , rhs , opts。
            -- mode: n(normal),i(insert),v(view)等
            -- lhs : 对应的按键
            -- rhs : 对应的功能
            -- opts: 相应的设置
            -- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
            vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
            vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)
            -- 关闭当前buffer
            vim.keymap.set("n", "<C-w>", ":bdelete %<CR>", opt)
            -- 根据picker选择要关闭的buffer
            vim.keymap.set("n", "<leader>bp", ":BufferLinePickClose<CR>", {noremap = true, silent = true})
            -- 删除当前buffer之外的所有buffer
            vim.keymap.set("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", {noremap = true, silent = true})
        end
    }
}
