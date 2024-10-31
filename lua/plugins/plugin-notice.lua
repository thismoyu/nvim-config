return {
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("noice").setup({
                presets = {
                    -- command_palette = true, -- position the cmdline and popupmenu together
                    inc_rename = true, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
                cmdline = {
                    view = "cmdline",
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