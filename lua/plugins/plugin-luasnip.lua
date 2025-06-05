-- https://github.com/L3MON4D3/LuaSnip
-- 代码补全ui层，通过cmp_luasnp连接 nvim-cmp，从nvim-cmp获取片段进行补全
-- 这里使用 friendly-snippets 中的片段，原生luasnip提供的写法太特么复杂了，搞不懂！！！
return {
    {
        -- Code snippet engine
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        lazy = true,
        event = 'BufRead',
        enabled = false,
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- 此插件用于将 luaship 和 nvim-cmp 作为适配器连接起来
            -- 如果没有这个，nvim-cmp中就无法读取到friendly-snippets里面的片段
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
        end
    }
}

