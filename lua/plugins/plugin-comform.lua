-- https://github.com/stevearc/conform.nvim
-- TODO 暂时关闭
return {
    {
        'stevearc/conform.nvim',
        lazy = true,
        event = 'BufWritePre',
        cmd = { 'ConformInfo' },
        dependencies = {
            -- ""
        },
        keys = {
            {
                '<leader>ff',
                function()
                    require('conform').format { async = true, lsp_format = 'fallback' }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- You can customize some of the format options for the filetype (:help conform.format)
                    rust = { "rustfmt", lsp_format = "fallback" },
                    -- Conform will run the first available formatter
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
                formatters = {
                    yamlfix = {
                        -- Change where to find the command
                        command = "local/path/yamlfix",
                        -- Adds environment args to the yamlfix formatter
                        env = {
                            YAMLFIX_SEQUENCE_STYLE = "block_style",
                        },
                    },
                },
            })
        end
    }
}
