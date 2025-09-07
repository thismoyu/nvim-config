-- https://github.com/stevearc/conform.nvim
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
                desc = '[F]ormat buffer by conform',
            },
        },
        config = function()
            -- 如果对应的lsp 服务支持格式化，会使用lsp的
            require("conform").setup({
                -- Maps filetypes to formatters
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "autopep8" },
                    markdown = { "markdownlint" },
                },
            })
        end
    }
}
