-- 括号自动补全
return {
    {
        -- https://github.com/windwp/nvim-autopairs
       'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
}