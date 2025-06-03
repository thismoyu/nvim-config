return {
    {
        -- -- https://github.com/hedyhli/outline.nvim
        -- -- 此插件依赖于lsp，需要配置了lsp服务，符号表由lsp提供
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = { { "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" } },
        config = function()
            require("outline").setup {
                outline_window = {
                    -- Auto close the outline window if goto_location is triggered and not for
                    -- peek_location
                    auto_close = true,
                }
            }
        end
    }
}
