-- lazy loaded
vim.schedule(function()
	vim.pack.add({ "https://github.com/folke/which-key.nvim", "https://github.com/nvim-tree/nvim-web-devicons" })
	local status_ok, wk = pcall(require, "which-key")
	if not status_ok then
		return
	end

	wk.setup({
		-- 提示风格
        preset = "modern",

		spec = {
			{ "<Esc><Esc>", hidden = true },
		},
	})

	-- TODO: grouping keymaps.
	wk.add({
  		{ "<leader>f", group = "Find" },
  	})

	local map = vim.keymap.set
	map("n", "<leader>?", "<cmd>WhichKey<CR>", { desc = "Keymaps" })
end)


