return {
    {
        -- https://github.com/hedyhli/outline.nvim
        -- 此插件依赖于lsp，需要配置了lsp服务，符号表由lsp提供
        "hedyhli/outline.nvim",
        keys = { "<leader>o", { "<cmd>Outline<CR>", mode = "n" ,desc = "Toggle Outline"} },
        config = function()
            require("outline").setup{}

            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
        end
    }
}