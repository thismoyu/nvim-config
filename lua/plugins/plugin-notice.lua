return {
    {
        "folke/noice.nvim",
        lazy = true,
        event = 'VeryLazy',
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                presets = {
                    -- command_palette = true, -- position the cmdline and popupmenu together
                    inc_rename = true,     -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
                cmdline = {
                    view = "cmdline",
                },
                messages = {
                    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                    -- This is a current Neovim limitation.
                    enabled = false,              -- enables the Noice messages UI
                    view = "notify",             -- default view for messages
                    view_error = "notify",       -- view for errors
                    view_warn = "notify",        -- view for warnings
                    view_history = "messages",   -- view for :messages
                    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
                },
                routes = {
                    {
                        filter = {
                            event = "msg_show",
                            any = {
                                { find = "%d+L, %d+B" },
                                { find = "; after #%d+" },
                                { find = "; before #%d+" },
                            },
                        },
                        view = "mini",
                    },
                },
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
            })
        end,
    }
}
