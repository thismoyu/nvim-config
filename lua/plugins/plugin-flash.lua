-- 此插件用于代码光标快速跳转
return
{
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = true, -- enable / search
            },
            char = {
                jump_labels = true, -- f/F/t/T 使用字符直接跳转
            },
        },
    },
    -- stylua: ignore
    keys = {
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },

        -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
}
