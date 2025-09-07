-- -- Collection of various small independent plugins/modules
return {
    {
        'echasnovski/mini.nvim',
        enabled = true,
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            -- require('mini.ai').setup { n_lines = 500 }
            -- require('mini.starter').setup{

            -- }

            require('mini.statusline').setup()
            require('mini.indentscope').setup()
            require('mini.notify').setup()

            -- require('mini.git').setup() --没 gitsigns好用感觉

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    }
}

