vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/akinsho/bufferline.nvim",
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		diagnostics_update_on_event = true,
		always_show_bufferline = true,
		separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
		},
	},
})

local map = vim.keymap.set
map("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
map("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
