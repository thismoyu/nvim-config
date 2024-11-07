-- 此插件用于代码光标快速跳转
return
{
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
        { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    }
}
