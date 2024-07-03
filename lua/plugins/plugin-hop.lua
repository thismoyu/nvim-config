return {
    {
        'smoka7/hop.nvim',
        -- lazy = true,
        -- keys = { "E" },
        config = function()
            require("hop").setup({})
            require("../plugins-config/hop")
        end
    }
}