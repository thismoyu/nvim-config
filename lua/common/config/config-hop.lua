-- 为什么要使用 pcall ? 当插件没有安装或者出现其他问题的时候，nvim在启动时，
-- 无法加载相关查询，就会抛出异常，通过 pcall 就可以进行相关捕获，从而不影响 nvim 的使用。
local status, hop = pcall(require, "hop")
if not status then
	vim.notify("没有找到 hop")
	return
end

hop.setup({
	keys = 'etovxqpdygfblzhckisuran',
})

-- F + 关键字向后跳转
vim.api.nvim_set_keymap("n", "F", "<cmd>HopChar1BC<cr>", { silent = true })
-- f + 关键字向前跳转
vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar1AC<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "U", "<cmd>HopWord<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "C", "<cmd>HopLine<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "P", "<cmd>HopPattern<cr>", { silent = true })
