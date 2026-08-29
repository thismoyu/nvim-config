-- ================================================================================================
-- TITLE : auto-commands
-- ABOUT : automatically run code on defined events (e.g. save, yank)
-- ================================================================================================

-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Close nvim-tree before quitting the last real window (e.g. :wq with tree open).
-- BufEnter-based auto-quit is unreliable with other plugins; QuitPre is the wiki recommendation.
local nvim_tree_quit_group = vim.api.nvim_create_augroup("NvimTreeQuitOnLastWindow", { clear = true })
vim.api.nvim_create_autocmd("QuitPre", {
	group = nvim_tree_quit_group,
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local buf = vim.api.nvim_win_get_buf(w)
			if vim.bo[buf].filetype == "NvimTree" then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		-- Only one non-tree, non-float window left → close tree so :q/:wq can exit nvim.
		if #wins - #floating_wins - #tree_wins == 1 then
			for _, w in ipairs(tree_wins) do
				pcall(vim.api.nvim_win_close, w, true)
			end
		end
	end,
})

