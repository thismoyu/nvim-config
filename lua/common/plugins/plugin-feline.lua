return {
    {
        -- 屏幕下方的状态栏
        -- https://github.com/famiu/feline.nvim
        "feline-nvim/feline.nvim",
        config = function()
              require("feline").setup()
              require("../../common/config/config-feline")
        end,
    }
}
