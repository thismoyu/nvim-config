local start = function()
	vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
	local cmp = require('blink.cmp')
	cmp.build():pwait()
	cmp.setup({
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "none",
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

			-- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
			-- ["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},
	})
end

-- blink needs 30~ms to setup, so just lazy load :)
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = start,
})