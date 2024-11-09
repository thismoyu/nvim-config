-- only store the color scheme configuration.
return {
    "catppuccin/nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- load the colorscheme here
        require("catppuccin").setup(
            {
                background = {
                    light = "latte",
                    dark = "mocha"
                },
                no_bold = false,
                no_italic = false,
                no_underline = false,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    notify = true,
                }
            }
        )
        vim.cmd.colorscheme("catppuccin")
    end,
}
