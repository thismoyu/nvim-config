-- 此插件用于代码光标快速跳转
return {
    {
        'smoka7/hop.nvim',
        lazy = true,
        -- only load when press f.
        keys = { "f" , "F" },
        config = function()
            require("hop").setup{
                keys = 'etovxqpdygfblzhckisuran',
            }

            -- F + 关键字向后跳转
            vim.api.nvim_set_keymap("n", "F", "<cmd>HopChar1BC<cr>", { silent = true })
            -- f + 关键字向前跳转
            vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar1AC<cr>", { silent = true })
            -- vim.api.nvim_set_keymap("n", "U", "<cmd>HopWord<cr>", { silent = true })
            -- vim.api.nvim_set_keymap("n", "C", "<cmd>HopLine<cr>", { silent = true })
            -- vim.api.nvim_set_keymap("n", "P", "<cmd>HopPattern<cr>", { silent = true })
        end
    }
}

