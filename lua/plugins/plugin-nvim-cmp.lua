-- 文档参考：https://www.cnblogs.com/w4ngzhen/p/17546969.html
-- 代码自动补全插件
return {
    {
        -- Auto-completion engine
        "hrsh7th/nvim-cmp",
        -- lazy load cmp on InsertEnter
        event = "InsertEnter",
        -- version = "*",
        -- all dependencies will load afte nvim-cmp loaded.
        dependencies = {
            "onsails/lspkind.nvim", -- 这个是美化用的
            -- 下面几个是补全候选来源
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",   -- buffer auto-completion
            "hrsh7th/cmp-path",     -- path auto-completion
            "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local lspkind = require('lspkind')

            cmp.setup {
                -- 指定snippet引擎，这里使用luasnip
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    -- <C-b/f> 在候选项的文档里面移动
                    -- Use <C-b/f> to scroll the docs
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    -- <C-k/j> 或者 <Tab>/<Shift-Tab> 在各种候选项里面移动
                    -- Use <C-k/j> to switch in items
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    -- <CR> 也就是回车键确定补全
                    -- Use <CR>(Enter) to confirm selection
                    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    -- A super tab
                    -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- Hint: if the completion menu is visible select next one
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }), -- i - insert mode; s - select mode
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                -- lspkind 补全菜单
                -- Let's configure the item's appearance
                -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
                formatting = {
                    -- 规定了每个候选项要显示什么东西
                    -- Set order from left to right
                    -- kind: single letter indicating the type of completion
                    -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
                    -- menu: extra text for the popup menu, displayed after "word" or "abbr"
                    -- fields = { 'abbr', 'menu' },

                    format = lspkind.cmp_format({
                        mode = 'symbol_text', -- show only symbol annotations.
                        maxwidth = {
                            menu = 50, -- leading text (lableDetails)
                            abbr = 50,
                        },
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (entry, vim_item)
                            vim_item.menu = ({
                                nvim_lsp = '[Lsp]',
                                luasnip = '[Luasnip]',
                                buffer = '[File]',
                                path = '[Path]',
                            })[entry.source.name]
                            return vim_item
                        end
                    }),
                },

                -- 补全来源：Set source precedence
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' }, -- For nvim-lsp
                    { name = 'luasnip' },  -- For luasnip user
                    { name = 'buffer' },   -- For buffer word completion
                    { name = 'path' },     -- For path completion
                })
            }

            -- 使用luasnip里面的loader加载外部的snippnet,比如friendly-snippet
            -- load vscode snippet (friendly-snippet)
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }
}
