-- only store the color scheme configuration.
return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        init = function()
            -- require("dracula").setup {}
            -- setup must be called before loading
            vim.cmd.colorscheme 'dracula'
            vim.cmd.hi 'Comment gui=None'
        end
    }
}

