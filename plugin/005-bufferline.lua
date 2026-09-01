vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-mini/mini.bufremove",
})

local function bufremove(bufnr)
	-- bufferline only auto-refreshes when close_command is a string; schedule redraw
	-- after lua close handlers so closing a non-current tab updates immediately.
	vim.schedule(function()
		require("mini.bufremove").delete(bufnr, false)
		vim.cmd.redrawtabline()
	end)
end

require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		diagnostics_update_on_event = true,
		always_show_bufferline = true,
		separator_style = "slant",
		close_command = bufremove,
		right_mouse_command = bufremove,
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
map("n", "<leader>bd", function()
	bufremove(0)
end, { desc = "Close buffer" })
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
map("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
-- Common buffer navigation (LazyVim / many configs use [b / ]b)
map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
