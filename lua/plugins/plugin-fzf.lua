return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = { "VeryLazy" },
    opts = {
        "default",
        winopts = {
            preview = {
                border = "noborder",
                vertical = "up:50%",
                horizontal = "right:50%",
                delay = 50,
            },
        },
        files = {
            path_shorten = 3,
        },
        diagnostics = {
            split = "belowright new",
        },
        -- previewers = {
        --     bat = {
        --         cmd = vim.pathlib.executable("batcat") and "batcat" or "bat",
        --     },
        -- },
    },
    keys = {
        { "<C-t>", "<cmd>FzfLua files<CR>", desc = "files list" },
        { "<C-f>", "<cmd>FzfLua live_grep<CR>", desc = "live grep" },
    },
}