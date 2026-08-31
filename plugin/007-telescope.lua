-- See https://neovim.io/doc/user/pack/#vim.pack-events
-- and https://www.reddit.com/r/neovim/comments/1pzwnls/vimpack_with_telescopefzfnative_how/
local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
		vim.print(ev.data.path)
		vim.system({ "make" }, { cwd = ev.data.path }):wait()
	end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/folke/todo-comments.nvim",
})

local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = {
			"%.git/",
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		fzf = {},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

-- pcall(telescope.load_extension, "fzf")
-- You can excute `make` in ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
require("telescope").load_extension("fzf")

-- set keymaps
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- 
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent files" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
-- SearchEverywhere（对齐 ideavim <leader><space>）
vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Search everywhere" })